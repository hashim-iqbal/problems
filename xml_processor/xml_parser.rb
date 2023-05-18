require 'nokogiri'
require 'ostruct'

class XmlParser
  attr_reader :hotel_reservation

  def initialize(file_path)
    xml_doc = Nokogiri::XML(File.open(file_path)).remove_namespaces!

    @hotel_reservation = xml_doc.at_css('OTA_HotelResNotifRQ > HotelReservations > HotelReservation')
  end

  def data
    OpenStruct.new({
      id: id,
      external_id: external_id,
      status: hotel_reservation['ResStatus'],
      services: services,
      rate_plan: rate_plan
    })
  end

  private

  def id
    hotel_reservation.at_css('ResGlobalInfo > HotelReservationIDs > HotelReservationID[@ResID_Type=10]')['ResID_Value']
  end

  def external_id
    hotel_reservation.at_css('ResGlobalInfo > HotelReservationIDs > HotelReservationID[@ResID_Type=16]')['ResID_Value']
  end

  def rate_plan
    rate_plan = hotel_reservation.at_css('RoomStays > RoomStay > RatePlans > RatePlan')

    OpenStruct.new({
      code: rate_plan['RatePlanCode'],
      description: rate_plan.at_css('RatePlanDescription').children.text.strip,
      tax_inclusive: rate_plan.at_css('RatePlanInclusions')['TaxInclusive'],
      meal_included: rate_plan.at_css('MealsIncluded')['MealPlanIndicator']
    })
  end

  def services
    hotel_reservation.at_css('RoomStays > RoomStay > Services').children.map { |child| child.text if child.name == 'Service' }.compact.join(', ')
  end
end
