//
//  APTimeZones.h
//  APTimeZones
//
//  Created by Sergii Kryvoblotskyi on 10/17/13.
//  Copyright (c) 2013 Alterplay. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "APTimeZones.h"

@interface APTimeZones ()
@property (nonatomic, strong) NSArray *timeZonesDB;
@end

@implementation APTimeZones

#pragma mark - Public

/*
 Get timezone with lat/lon and country code
 */

- (NSTimeZone *)timeZoneWithLocation:(CLLocation *)location {
    
    NSDictionary *closeseZoneInfo = [self closesZoneInfoWithLocation:location
                                                              source:self.timeZonesDB];
    
    //We've found nothing. Let's use system.
    if (closeseZoneInfo == nil) {
        return [NSTimeZone systemTimeZone];
    }
    
    //Get timezone
    NSTimeZone *timeZone = [self timeZoneWithDictionary:closeseZoneInfo];
    
    //Can't create time zone. Take system.
    if (timeZone == nil) {
        NSAssert(timeZone != nil, @"Can't create timezone: %@", closeseZoneInfo);
        timeZone = [NSTimeZone systemTimeZone];
    }
    
    return timeZone;
}

/*
 Get timezone with lat/lon and country code
 */

- (NSTimeZone *)timeZoneWithLocation:(CLLocation *)location countryCode:(NSString *)countryCode {
    
    //No country
    if (countryCode == nil) {
        return [self timeZoneWithLocation:location];
    }
    
    //Filter
    NSArray *filteredZones = [self filteredTimeZonesWithCountyCode:countryCode];
    
    //Get closest zone info
    NSDictionary *closeseZoneInfo = [self closesZoneInfoWithLocation:location
                                                              source:filteredZones];
    //Get timezone
    NSTimeZone *timeZone = [self timeZoneWithDictionary:closeseZoneInfo];
    
    //If there is no time zone with code. Let's try to find it anyway
    if (timeZone == nil) {
        return [self timeZoneWithLocation:location];
    }
    return timeZone;
}

#pragma mark - Private
- (NSArray *)timeZonesDB {
    if (_timeZonesDB == nil) {
        _timeZonesDB = @[
                         @{
                             @"country_code": @"CI",
                             @"latitude": @5.31666,
                             @"longitude": @-4.03334,
                             @"comments": @"",
                             @"zone": @"Africa/Abidjan"
                             },
                         @{
                             @"country_code": @"GH",
                             @"latitude": @5.55,
                             @"longitude": @-0.21666999999999,
                             @"comments": @"",
                             @"zone": @"Africa/Accra"
                             },
                         @{
                             @"country_code": @"ET",
                             @"latitude": @9.03333,
                             @"longitude": @38.7,
                             @"comments": @"",
                             @"zone": @"Africa/Addis_Ababa"
                             },
                         @{
                             @"country_code": @"DZ",
                             @"latitude": @36.78333,
                             @"longitude": @3.05,
                             @"comments": @"",
                             @"zone": @"Africa/Algiers"
                             },
                         @{
                             @"country_code": @"ER",
                             @"latitude": @15.33333,
                             @"longitude": @38.88333,
                             @"comments": @"",
                             @"zone": @"Africa/Asmara"
                             },
                         @{
                             @"country_code": @"ML",
                             @"latitude": @12.65,
                             @"longitude": @-8,
                             @"comments": @"",
                             @"zone": @"Africa/Bamako"
                             },
                         @{
                             @"country_code": @"CF",
                             @"latitude": @4.36666,
                             @"longitude": @18.58333,
                             @"comments": @"",
                             @"zone": @"Africa/Bangui"
                             },
                         @{
                             @"country_code": @"GM",
                             @"latitude": @13.46666,
                             @"longitude": @-16.65,
                             @"comments": @"",
                             @"zone": @"Africa/Banjul"
                             },
                         @{
                             @"country_code": @"GW",
                             @"latitude": @11.85,
                             @"longitude": @-15.58334,
                             @"comments": @"",
                             @"zone": @"Africa/Bissau"
                             },
                         @{
                             @"country_code": @"MW",
                             @"latitude": @-15.78334,
                             @"longitude": @35,
                             @"comments": @"",
                             @"zone": @"Africa/Blantyre"
                             },
                         @{
                             @"country_code": @"CG",
                             @"latitude": @-4.26667,
                             @"longitude": @15.28333,
                             @"comments": @"",
                             @"zone": @"Africa/Brazzaville"
                             },
                         @{
                             @"country_code": @"BI",
                             @"latitude": @-3.38334,
                             @"longitude": @29.36666,
                             @"comments": @"",
                             @"zone": @"Africa/Bujumbura"
                             },
                         @{
                             @"country_code": @"EG",
                             @"latitude": @30.05,
                             @"longitude": @31.25,
                             @"comments": @"",
                             @"zone": @"Africa/Cairo"
                             },
                         @{
                             @"country_code": @"MA",
                             @"latitude": @33.65,
                             @"longitude": @-7.58334,
                             @"comments": @"",
                             @"zone": @"Africa/Casablanca"
                             },
                         @{
                             @"country_code": @"ES",
                             @"latitude": @35.88333,
                             @"longitude": @-5.31667,
                             @"comments": @"Ceuta & Melilla",
                             @"zone": @"Africa/Ceuta"
                             },
                         @{
                             @"country_code": @"GN",
                             @"latitude": @9.51666,
                             @"longitude": @-13.71667,
                             @"comments": @"",
                             @"zone": @"Africa/Conakry"
                             },
                         @{
                             @"country_code": @"SN",
                             @"latitude": @14.66666,
                             @"longitude": @-17.43334,
                             @"comments": @"",
                             @"zone": @"Africa/Dakar"
                             },
                         @{
                             @"country_code": @"TZ",
                             @"latitude": @-6.8,
                             @"longitude": @39.28333,
                             @"comments": @"",
                             @"zone": @"Africa/Dar_es_Salaam"
                             },
                         @{
                             @"country_code": @"DJ",
                             @"latitude": @11.6,
                             @"longitude": @43.15,
                             @"comments": @"",
                             @"zone": @"Africa/Djibouti"
                             },
                         @{
                             @"country_code": @"CM",
                             @"latitude": @4.05,
                             @"longitude": @9.7,
                             @"comments": @"",
                             @"zone": @"Africa/Douala"
                             },
                         @{
                             @"country_code": @"EH",
                             @"latitude": @27.15,
                             @"longitude": @-13.2,
                             @"comments": @"",
                             @"zone": @"Africa/El_Aaiun"
                             },
                         @{
                             @"country_code": @"SL",
                             @"latitude": @8.5,
                             @"longitude": @-13.25,
                             @"comments": @"",
                             @"zone": @"Africa/Freetown"
                             },
                         @{
                             @"country_code": @"BW",
                             @"latitude": @-24.65001,
                             @"longitude": @25.91666,
                             @"comments": @"",
                             @"zone": @"Africa/Gaborone"
                             },
                         @{
                             @"country_code": @"ZW",
                             @"latitude": @-17.83334,
                             @"longitude": @31.05,
                             @"comments": @"",
                             @"zone": @"Africa/Harare"
                             },
                         @{
                             @"country_code": @"ZA",
                             @"latitude": @-26.25,
                             @"longitude": @28,
                             @"comments": @"",
                             @"zone": @"Africa/Johannesburg"
                             },
                         @{
                             @"country_code": @"SS",
                             @"latitude": @4.85,
                             @"longitude": @31.6,
                             @"comments": @"",
                             @"zone": @"Africa/Juba"
                             },
                         @{
                             @"country_code": @"UG",
                             @"latitude": @0.31666,
                             @"longitude": @32.41666,
                             @"comments": @"",
                             @"zone": @"Africa/Kampala"
                             },
                         @{
                             @"country_code": @"SD",
                             @"latitude": @15.6,
                             @"longitude": @32.53333,
                             @"comments": @"",
                             @"zone": @"Africa/Khartoum"
                             },
                         @{
                             @"country_code": @"RW",
                             @"latitude": @-1.95,
                             @"longitude": @30.06666,
                             @"comments": @"",
                             @"zone": @"Africa/Kigali"
                             },
                         @{
                             @"country_code": @"CD",
                             @"latitude": @-4.3,
                             @"longitude": @15.3,
                             @"comments": @"west Dem. Rep. of Congo",
                             @"zone": @"Africa/Kinshasa"
                             },
                         @{
                             @"country_code": @"NG",
                             @"latitude": @6.45,
                             @"longitude": @3.4,
                             @"comments": @"",
                             @"zone": @"Africa/Lagos"
                             },
                         @{
                             @"country_code": @"GA",
                             @"latitude": @0.38333,
                             @"longitude": @9.45,
                             @"comments": @"",
                             @"zone": @"Africa/Libreville"
                             },
                         @{
                             @"country_code": @"TG",
                             @"latitude": @6.13333,
                             @"longitude": @1.21666,
                             @"comments": @"",
                             @"zone": @"Africa/Lome"
                             },
                         @{
                             @"country_code": @"AO",
                             @"latitude": @-8.8,
                             @"longitude": @13.23333,
                             @"comments": @"",
                             @"zone": @"Africa/Luanda"
                             },
                         @{
                             @"country_code": @"CD",
                             @"latitude": @-11.66667,
                             @"longitude": @27.46666,
                             @"comments": @"east Dem. Rep. of Congo",
                             @"zone": @"Africa/Lubumbashi"
                             },
                         @{
                             @"country_code": @"ZM",
                             @"latitude": @-15.41667,
                             @"longitude": @28.28333,
                             @"comments": @"",
                             @"zone": @"Africa/Lusaka"
                             },
                         @{
                             @"country_code": @"GQ",
                             @"latitude": @3.75,
                             @"longitude": @8.78333,
                             @"comments": @"",
                             @"zone": @"Africa/Malabo"
                             },
                         @{
                             @"country_code": @"MZ",
                             @"latitude": @-25.96667,
                             @"longitude": @32.58333,
                             @"comments": @"",
                             @"zone": @"Africa/Maputo"
                             },
                         @{
                             @"country_code": @"LS",
                             @"latitude": @-29.46667,
                             @"longitude": @27.5,
                             @"comments": @"",
                             @"zone": @"Africa/Maseru"
                             },
                         @{
                             @"country_code": @"SZ",
                             @"latitude": @-26.3,
                             @"longitude": @31.1,
                             @"comments": @"",
                             @"zone": @"Africa/Mbabane"
                             },
                         @{
                             @"country_code": @"SO",
                             @"latitude": @2.06666,
                             @"longitude": @45.36666,
                             @"comments": @"",
                             @"zone": @"Africa/Mogadishu"
                             },
                         @{
                             @"country_code": @"LR",
                             @"latitude": @6.3,
                             @"longitude": @-10.78334,
                             @"comments": @"",
                             @"zone": @"Africa/Monrovia"
                             },
                         @{
                             @"country_code": @"KE",
                             @"latitude": @-1.28334,
                             @"longitude": @36.81666,
                             @"comments": @"",
                             @"zone": @"Africa/Nairobi"
                             },
                         @{
                             @"country_code": @"TD",
                             @"latitude": @12.11666,
                             @"longitude": @15.05,
                             @"comments": @"",
                             @"zone": @"Africa/Ndjamena"
                             },
                         @{
                             @"country_code": @"NE",
                             @"latitude": @13.51666,
                             @"longitude": @2.11666,
                             @"comments": @"",
                             @"zone": @"Africa/Niamey"
                             },
                         @{
                             @"country_code": @"MR",
                             @"latitude": @18.1,
                             @"longitude": @-15.95,
                             @"comments": @"",
                             @"zone": @"Africa/Nouakchott"
                             },
                         @{
                             @"country_code": @"BF",
                             @"latitude": @12.36666,
                             @"longitude": @-1.51667,
                             @"comments": @"",
                             @"zone": @"Africa/Ouagadougou"
                             },
                         @{
                             @"country_code": @"BJ",
                             @"latitude": @6.48333,
                             @"longitude": @2.61666,
                             @"comments": @"",
                             @"zone": @"Africa/Porto-Novo"
                             },
                         @{
                             @"country_code": @"ST",
                             @"latitude": @0.33333,
                             @"longitude": @6.73333,
                             @"comments": @"",
                             @"zone": @"Africa/Sao_Tome"
                             },
                         @{
                             @"country_code": @"LY",
                             @"latitude": @32.9,
                             @"longitude": @13.18333,
                             @"comments": @"",
                             @"zone": @"Africa/Tripoli"
                             },
                         @{
                             @"country_code": @"TN",
                             @"latitude": @36.8,
                             @"longitude": @10.18333,
                             @"comments": @"",
                             @"zone": @"Africa/Tunis"
                             },
                         @{
                             @"country_code": @"NA",
                             @"latitude": @-22.56667,
                             @"longitude": @17.1,
                             @"comments": @"",
                             @"zone": @"Africa/Windhoek"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @51.88,
                             @"longitude": @-176.65806,
                             @"comments": @"Aleutian Islands",
                             @"zone": @"America/Adak"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @61.21805,
                             @"longitude": @-149.90028,
                             @"comments": @"Alaska Time",
                             @"zone": @"America/Anchorage"
                             },
                         @{
                             @"country_code": @"AI",
                             @"latitude": @18.2,
                             @"longitude": @-63.06667,
                             @"comments": @"",
                             @"zone": @"America/Anguilla"
                             },
                         @{
                             @"country_code": @"AG",
                             @"latitude": @17.05,
                             @"longitude": @-61.8,
                             @"comments": @"",
                             @"zone": @"America/Antigua"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-7.2,
                             @"longitude": @-48.2,
                             @"comments": @"Tocantins",
                             @"zone": @"America/Araguaina"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-34.6,
                             @"longitude": @-58.45,
                             @"comments": @"Buenos Aires (BA, CF)",
                             @"zone": @"America/Argentina/Buenos_Aires"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-28.46667,
                             @"longitude": @-65.78334,
                             @"comments": @"Catamarca (CT), Chubut (CH)",
                             @"zone": @"America/Argentina/Catamarca"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-31.4,
                             @"longitude": @-64.18334,
                             @"comments": @"most locations (CB, CC, CN, ER, FM, MN, SE, SF)",
                             @"zone": @"America/Argentina/Cordoba"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-24.18334,
                             @"longitude": @-65.3,
                             @"comments": @"Jujuy (JY)",
                             @"zone": @"America/Argentina/Jujuy"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-29.43334,
                             @"longitude": @-66.85,
                             @"comments": @"La Rioja (LR)",
                             @"zone": @"America/Argentina/La_Rioja"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-32.88334,
                             @"longitude": @-68.81667,
                             @"comments": @"Mendoza (MZ)",
                             @"zone": @"America/Argentina/Mendoza"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-51.63334,
                             @"longitude": @-69.21667,
                             @"comments": @"Santa Cruz (SC)",
                             @"zone": @"America/Argentina/Rio_Gallegos"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-24.78334,
                             @"longitude": @-65.41667,
                             @"comments": @"(SA, LP, NQ, RN)",
                             @"zone": @"America/Argentina/Salta"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-31.53334,
                             @"longitude": @-68.51667,
                             @"comments": @"San Juan (SJ)",
                             @"zone": @"America/Argentina/San_Juan"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-33.31667,
                             @"longitude": @-66.35,
                             @"comments": @"San Luis (SL)",
                             @"zone": @"America/Argentina/San_Luis"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-26.81667,
                             @"longitude": @-65.21667,
                             @"comments": @"Tucuman (TM)",
                             @"zone": @"America/Argentina/Tucuman"
                             },
                         @{
                             @"country_code": @"AR",
                             @"latitude": @-54.8,
                             @"longitude": @-68.3,
                             @"comments": @"Tierra del Fuego (TF)",
                             @"zone": @"America/Argentina/Ushuaia"
                             },
                         @{
                             @"country_code": @"AW",
                             @"latitude": @12.5,
                             @"longitude": @-69.96667,
                             @"comments": @"",
                             @"zone": @"America/Aruba"
                             },
                         @{
                             @"country_code": @"PY",
                             @"latitude": @-25.26667,
                             @"longitude": @-57.66667,
                             @"comments": @"",
                             @"zone": @"America/Asuncion"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @48.75861,
                             @"longitude": @-91.62167,
                             @"comments": @"Eastern Standard Time - Atikokan, Ontario and Southampton I, Nunavut",
                             @"zone": @"America/Atikokan"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-12.98334,
                             @"longitude": @-38.51667,
                             @"comments": @"Bahia",
                             @"zone": @"America/Bahia"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @20.8,
                             @"longitude": @-105.25,
                             @"comments": @"Mexican Central Time - Bahia de Banderas",
                             @"zone": @"America/Bahia_Banderas"
                             },
                         @{
                             @"country_code": @"BB",
                             @"latitude": @13.1,
                             @"longitude": @-59.61667,
                             @"comments": @"",
                             @"zone": @"America/Barbados"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-1.45,
                             @"longitude": @-48.48334,
                             @"comments": @"Amapa, E Para",
                             @"zone": @"America/Belem"
                             },
                         @{
                             @"country_code": @"BZ",
                             @"latitude": @17.5,
                             @"longitude": @-88.2,
                             @"comments": @"",
                             @"zone": @"America/Belize"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @51.41666,
                             @"longitude": @-57.11667,
                             @"comments": @"Atlantic Standard Time - Quebec - Lower North Shore",
                             @"zone": @"America/Blanc-Sablon"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @2.81666,
                             @"longitude": @-60.66667,
                             @"comments": @"Roraima",
                             @"zone": @"America/Boa_Vista"
                             },
                         @{
                             @"country_code": @"CO",
                             @"latitude": @4.6,
                             @"longitude": @-74.08334,
                             @"comments": @"",
                             @"zone": @"America/Bogota"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @43.61361,
                             @"longitude": @-116.2025,
                             @"comments": @"Mountain Time - south Idaho & east Oregon",
                             @"zone": @"America/Boise"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @69.11388,
                             @"longitude": @-105.05278,
                             @"comments": @"Mountain Time - west Nunavut",
                             @"zone": @"America/Cambridge_Bay"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-20.45,
                             @"longitude": @-54.61667,
                             @"comments": @"Mato Grosso do Sul",
                             @"zone": @"America/Campo_Grande"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @21.08333,
                             @"longitude": @-86.76667,
                             @"comments": @"Central Time - Quintana Roo",
                             @"zone": @"America/Cancun"
                             },
                         @{
                             @"country_code": @"VE",
                             @"latitude": @10.5,
                             @"longitude": @-66.93334,
                             @"comments": @"",
                             @"zone": @"America/Caracas"
                             },
                         @{
                             @"country_code": @"GF",
                             @"latitude": @4.93333,
                             @"longitude": @-52.33334,
                             @"comments": @"",
                             @"zone": @"America/Cayenne"
                             },
                         @{
                             @"country_code": @"KY",
                             @"latitude": @19.3,
                             @"longitude": @-81.38334,
                             @"comments": @"",
                             @"zone": @"America/Cayman"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @41.85,
                             @"longitude": @-87.65,
                             @"comments": @"Central Time",
                             @"zone": @"America/Chicago"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @28.63333,
                             @"longitude": @-106.08334,
                             @"comments": @"Mexican Mountain Time - Chihuahua away from US border",
                             @"zone": @"America/Chihuahua"
                             },
                         @{
                             @"country_code": @"CR",
                             @"latitude": @9.93333,
                             @"longitude": @-84.08334,
                             @"comments": @"",
                             @"zone": @"America/Costa_Rica"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @49.1,
                             @"longitude": @-116.51667,
                             @"comments": @"Mountain Standard Time - Creston, British Columbia",
                             @"zone": @"America/Creston"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-15.58334,
                             @"longitude": @-56.08334,
                             @"comments": @"Mato Grosso",
                             @"zone": @"America/Cuiaba"
                             },
                         @{
                             @"country_code": @"CW",
                             @"latitude": @12.18333,
                             @"longitude": @-69,
                             @"comments": @"",
                             @"zone": @"America/Curacao"
                             },
                         @{
                             @"country_code": @"GL",
                             @"latitude": @76.76666,
                             @"longitude": @-18.66667,
                             @"comments": @"east coast, north of Scoresbysund",
                             @"zone": @"America/Danmarkshavn"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @64.06666,
                             @"longitude": @-139.41667,
                             @"comments": @"Pacific Time - north Yukon",
                             @"zone": @"America/Dawson"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @59.76666,
                             @"longitude": @-120.23334,
                             @"comments": @"Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia",
                             @"zone": @"America/Dawson_Creek"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @39.73916,
                             @"longitude": @-104.98417,
                             @"comments": @"Mountain Time",
                             @"zone": @"America/Denver"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @42.33138,
                             @"longitude": @-83.04584,
                             @"comments": @"Eastern Time - Michigan - most locations",
                             @"zone": @"America/Detroit"
                             },
                         @{
                             @"country_code": @"DM",
                             @"latitude": @15.3,
                             @"longitude": @-61.4,
                             @"comments": @"",
                             @"zone": @"America/Dominica"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @53.55,
                             @"longitude": @-113.46667,
                             @"comments": @"Mountain Time - Alberta, east British Columbia & west Saskatchewan",
                             @"zone": @"America/Edmonton"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-6.66667,
                             @"longitude": @-69.86667,
                             @"comments": @"W Amazonas",
                             @"zone": @"America/Eirunepe"
                             },
                         @{
                             @"country_code": @"SV",
                             @"latitude": @13.7,
                             @"longitude": @-89.2,
                             @"comments": @"",
                             @"zone": @"America/El_Salvador"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-3.71667,
                             @"longitude": @-38.5,
                             @"comments": @"NE Brazil (MA, PI, CE, RN, PB)",
                             @"zone": @"America/Fortaleza"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @46.19999,
                             @"longitude": @-59.95,
                             @"comments": @"Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971",
                             @"zone": @"America/Glace_Bay"
                             },
                         @{
                             @"country_code": @"GL",
                             @"latitude": @64.18333,
                             @"longitude": @-51.73334,
                             @"comments": @"most locations",
                             @"zone": @"America/Godthab"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @53.33333,
                             @"longitude": @-60.41667,
                             @"comments": @"Atlantic Time - Labrador - most locations",
                             @"zone": @"America/Goose_Bay"
                             },
                         @{
                             @"country_code": @"TC",
                             @"latitude": @21.46666,
                             @"longitude": @-71.13334,
                             @"comments": @"",
                             @"zone": @"America/Grand_Turk"
                             },
                         @{
                             @"country_code": @"GD",
                             @"latitude": @12.05,
                             @"longitude": @-61.75,
                             @"comments": @"",
                             @"zone": @"America/Grenada"
                             },
                         @{
                             @"country_code": @"GP",
                             @"latitude": @16.23333,
                             @"longitude": @-61.53334,
                             @"comments": @"",
                             @"zone": @"America/Guadeloupe"
                             },
                         @{
                             @"country_code": @"GT",
                             @"latitude": @14.63333,
                             @"longitude": @-90.51667,
                             @"comments": @"",
                             @"zone": @"America/Guatemala"
                             },
                         @{
                             @"country_code": @"EC",
                             @"latitude": @-2.16667,
                             @"longitude": @-79.83334,
                             @"comments": @"mainland",
                             @"zone": @"America/Guayaquil"
                             },
                         @{
                             @"country_code": @"GY",
                             @"latitude": @6.8,
                             @"longitude": @-58.16667,
                             @"comments": @"",
                             @"zone": @"America/Guyana"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @44.65,
                             @"longitude": @-63.6,
                             @"comments": @"Atlantic Time - Nova Scotia (most places), PEI",
                             @"zone": @"America/Halifax"
                             },
                         @{
                             @"country_code": @"CU",
                             @"latitude": @23.13333,
                             @"longitude": @-82.36667,
                             @"comments": @"",
                             @"zone": @"America/Havana"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @29.06666,
                             @"longitude": @-110.96667,
                             @"comments": @"Mountain Standard Time - Sonora",
                             @"zone": @"America/Hermosillo"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @39.76833,
                             @"longitude": @-86.15806,
                             @"comments": @"Eastern Time - Indiana - most locations",
                             @"zone": @"America/Indiana/Indianapolis"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @41.29583,
                             @"longitude": @-86.625,
                             @"comments": @"Central Time - Indiana - Starke County",
                             @"zone": @"America/Indiana/Knox"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @38.37555,
                             @"longitude": @-86.34473,
                             @"comments": @"Eastern Time - Indiana - Crawford County",
                             @"zone": @"America/Indiana/Marengo"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @38.49194,
                             @"longitude": @-87.27862,
                             @"comments": @"Eastern Time - Indiana - Pike County",
                             @"zone": @"America/Indiana/Petersburg"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @37.95305,
                             @"longitude": @-86.76139,
                             @"comments": @"Central Time - Indiana - Perry County",
                             @"zone": @"America/Indiana/Tell_City"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @38.74777,
                             @"longitude": @-85.06723,
                             @"comments": @"Eastern Time - Indiana - Switzerland County",
                             @"zone": @"America/Indiana/Vevay"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @38.67722,
                             @"longitude": @-87.52862,
                             @"comments": @"Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties",
                             @"zone": @"America/Indiana/Vincennes"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @41.05138,
                             @"longitude": @-86.60306,
                             @"comments": @"Eastern Time - Indiana - Pulaski County",
                             @"zone": @"America/Indiana/Winamac"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @68.34972,
                             @"longitude": @-133.71667,
                             @"comments": @"Mountain Time - west Northwest Territories",
                             @"zone": @"America/Inuvik"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @63.73333,
                             @"longitude": @-68.46667,
                             @"comments": @"Eastern Time - east Nunavut - most locations",
                             @"zone": @"America/Iqaluit"
                             },
                         @{
                             @"country_code": @"JM",
                             @"latitude": @18,
                             @"longitude": @-76.8,
                             @"comments": @"",
                             @"zone": @"America/Jamaica"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @58.30194,
                             @"longitude": @-134.41973,
                             @"comments": @"Alaska Time - Alaska panhandle",
                             @"zone": @"America/Juneau"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @38.25416,
                             @"longitude": @-85.75945,
                             @"comments": @"Eastern Time - Kentucky - Louisville area",
                             @"zone": @"America/Kentucky/Louisville"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @36.82972,
                             @"longitude": @-84.84917,
                             @"comments": @"Eastern Time - Kentucky - Wayne County",
                             @"zone": @"America/Kentucky/Monticello"
                             },
                         @{
                             @"country_code": @"BQ",
                             @"latitude": @12.15083,
                             @"longitude": @-68.27667,
                             @"comments": @"",
                             @"zone": @"America/Kralendijk"
                             },
                         @{
                             @"country_code": @"BO",
                             @"latitude": @-16.5,
                             @"longitude": @-68.15,
                             @"comments": @"",
                             @"zone": @"America/La_Paz"
                             },
                         @{
                             @"country_code": @"PE",
                             @"latitude": @-12.05,
                             @"longitude": @-77.05,
                             @"comments": @"",
                             @"zone": @"America/Lima"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @34.05222,
                             @"longitude": @-118.24278,
                             @"comments": @"Pacific Time",
                             @"zone": @"America/Los_Angeles"
                             },
                         @{
                             @"country_code": @"SX",
                             @"latitude": @18.05138,
                             @"longitude": @-63.04723,
                             @"comments": @"",
                             @"zone": @"America/Lower_Princes"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-9.66667,
                             @"longitude": @-35.71667,
                             @"comments": @"Alagoas, Sergipe",
                             @"zone": @"America/Maceio"
                             },
                         @{
                             @"country_code": @"NI",
                             @"latitude": @12.15,
                             @"longitude": @-86.28334,
                             @"comments": @"",
                             @"zone": @"America/Managua"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-3.13334,
                             @"longitude": @-60.01667,
                             @"comments": @"E Amazonas",
                             @"zone": @"America/Manaus"
                             },
                         @{
                             @"country_code": @"MF",
                             @"latitude": @18.06666,
                             @"longitude": @-63.08334,
                             @"comments": @"",
                             @"zone": @"America/Marigot"
                             },
                         @{
                             @"country_code": @"MQ",
                             @"latitude": @14.6,
                             @"longitude": @-61.08334,
                             @"comments": @"",
                             @"zone": @"America/Martinique"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @25.83333,
                             @"longitude": @-97.5,
                             @"comments": @"US Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas near US border",
                             @"zone": @"America/Matamoros"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @23.21666,
                             @"longitude": @-106.41667,
                             @"comments": @"Mountain Time - S Baja, Nayarit, Sinaloa",
                             @"zone": @"America/Mazatlan"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @45.10777,
                             @"longitude": @-87.61417,
                             @"comments": @"Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties",
                             @"zone": @"America/Menominee"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @20.96666,
                             @"longitude": @-89.61667,
                             @"comments": @"Central Time - Campeche, Yucatan",
                             @"zone": @"America/Merida"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @55.12694,
                             @"longitude": @-131.57639,
                             @"comments": @"Metlakatla Time - Annette Island",
                             @"zone": @"America/Metlakatla"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @19.4,
                             @"longitude": @-99.15001,
                             @"comments": @"Central Time - most locations",
                             @"zone": @"America/Mexico_City"
                             },
                         @{
                             @"country_code": @"PM",
                             @"latitude": @47.05,
                             @"longitude": @-56.33334,
                             @"comments": @"",
                             @"zone": @"America/Miquelon"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @46.1,
                             @"longitude": @-64.78334,
                             @"comments": @"Atlantic Time - New Brunswick",
                             @"zone": @"America/Moncton"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @25.66666,
                             @"longitude": @-100.31667,
                             @"comments": @"Mexican Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas away from US border",
                             @"zone": @"America/Monterrey"
                             },
                         @{
                             @"country_code": @"UY",
                             @"latitude": @-34.88334,
                             @"longitude": @-56.18334,
                             @"comments": @"",
                             @"zone": @"America/Montevideo"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @45.51666,
                             @"longitude": @-73.56667,
                             @"comments": @"Eastern Time - Quebec - most locations",
                             @"zone": @"America/Montreal"
                             },
                         @{
                             @"country_code": @"MS",
                             @"latitude": @16.71666,
                             @"longitude": @-62.21667,
                             @"comments": @"",
                             @"zone": @"America/Montserrat"
                             },
                         @{
                             @"country_code": @"BS",
                             @"latitude": @25.08333,
                             @"longitude": @-77.35,
                             @"comments": @"",
                             @"zone": @"America/Nassau"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @40.71416,
                             @"longitude": @-74.00639,
                             @"comments": @"Eastern Time",
                             @"zone": @"America/New_York"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @49.01666,
                             @"longitude": @-88.26667,
                             @"comments": @"Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973",
                             @"zone": @"America/Nipigon"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @64.50111,
                             @"longitude": @-165.40639,
                             @"comments": @"Alaska Time - west Alaska",
                             @"zone": @"America/Nome"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-3.85,
                             @"longitude": @-32.41667,
                             @"comments": @"Atlantic islands",
                             @"zone": @"America/Noronha"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @47.26416,
                             @"longitude": @-101.77778,
                             @"comments": @"Central Time - North Dakota - Mercer County",
                             @"zone": @"America/North_Dakota/Beulah"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @47.11638,
                             @"longitude": @-101.29917,
                             @"comments": @"Central Time - North Dakota - Oliver County",
                             @"zone": @"America/North_Dakota/Center"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @46.845,
                             @"longitude": @-101.41084,
                             @"comments": @"Central Time - North Dakota - Morton County (except Mandan area)",
                             @"zone": @"America/North_Dakota/New_Salem"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @29.56666,
                             @"longitude": @-104.41667,
                             @"comments": @"US Mountain Time - Chihuahua near US border",
                             @"zone": @"America/Ojinaga"
                             },
                         @{
                             @"country_code": @"PA",
                             @"latitude": @8.96666,
                             @"longitude": @-79.53334,
                             @"comments": @"",
                             @"zone": @"America/Panama"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @66.13333,
                             @"longitude": @-65.73334,
                             @"comments": @"Eastern Time - Pangnirtung, Nunavut",
                             @"zone": @"America/Pangnirtung"
                             },
                         @{
                             @"country_code": @"SR",
                             @"latitude": @5.83333,
                             @"longitude": @-55.16667,
                             @"comments": @"",
                             @"zone": @"America/Paramaribo"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @33.44833,
                             @"longitude": @-112.07334,
                             @"comments": @"Mountain Standard Time - Arizona",
                             @"zone": @"America/Phoenix"
                             },
                         @{
                             @"country_code": @"HT",
                             @"latitude": @18.53333,
                             @"longitude": @-72.33334,
                             @"comments": @"",
                             @"zone": @"America/Port-au-Prince"
                             },
                         @{
                             @"country_code": @"TT",
                             @"latitude": @10.65,
                             @"longitude": @-61.51667,
                             @"comments": @"",
                             @"zone": @"America/Port_of_Spain"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-8.76667,
                             @"longitude": @-63.9,
                             @"comments": @"Rondonia",
                             @"zone": @"America/Porto_Velho"
                             },
                         @{
                             @"country_code": @"PR",
                             @"latitude": @18.46833,
                             @"longitude": @-66.10612,
                             @"comments": @"",
                             @"zone": @"America/Puerto_Rico"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @48.71666,
                             @"longitude": @-94.56667,
                             @"comments": @"Central Time - Rainy River & Fort Frances, Ontario",
                             @"zone": @"America/Rainy_River"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @62.81666,
                             @"longitude": @-92.08306,
                             @"comments": @"Central Time - central Nunavut",
                             @"zone": @"America/Rankin_Inlet"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-8.05,
                             @"longitude": @-34.9,
                             @"comments": @"Pernambuco",
                             @"zone": @"America/Recife"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @50.4,
                             @"longitude": @-104.65001,
                             @"comments": @"Central Standard Time - Saskatchewan - most locations",
                             @"zone": @"America/Regina"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @74.69555,
                             @"longitude": @-94.82917,
                             @"comments": @"Central Standard Time - Resolute, Nunavut",
                             @"zone": @"America/Resolute"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-9.96667,
                             @"longitude": @-67.8,
                             @"comments": @"Acre",
                             @"zone": @"America/Rio_Branco"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @30.3,
                             @"longitude": @-114.86667,
                             @"comments": @"Mexican Pacific Time - Baja California away from US border",
                             @"zone": @"America/Santa_Isabel"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-2.43334,
                             @"longitude": @-54.86667,
                             @"comments": @"W Para",
                             @"zone": @"America/Santarem"
                             },
                         @{
                             @"country_code": @"CL",
                             @"latitude": @-33.45,
                             @"longitude": @-70.66667,
                             @"comments": @"most locations",
                             @"zone": @"America/Santiago"
                             },
                         @{
                             @"country_code": @"DO",
                             @"latitude": @18.46666,
                             @"longitude": @-69.9,
                             @"comments": @"",
                             @"zone": @"America/Santo_Domingo"
                             },
                         @{
                             @"country_code": @"BR",
                             @"latitude": @-23.53334,
                             @"longitude": @-46.61667,
                             @"comments": @"S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)",
                             @"zone": @"America/Sao_Paulo"
                             },
                         @{
                             @"country_code": @"GL",
                             @"latitude": @70.48333,
                             @"longitude": @-21.96667,
                             @"comments": @"Scoresbysund / Ittoqqortoormiit",
                             @"zone": @"America/Scoresbysund"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @36.78555,
                             @"longitude": @-108.68639,
                             @"comments": @"Mountain Time - Navajo",
                             @"zone": @"America/Shiprock"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @57.17638,
                             @"longitude": @-135.30195,
                             @"comments": @"Alaska Time - southeast Alaska panhandle",
                             @"zone": @"America/Sitka"
                             },
                         @{
                             @"country_code": @"BL",
                             @"latitude": @17.88333,
                             @"longitude": @-62.85,
                             @"comments": @"",
                             @"zone": @"America/St_Barthelemy"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @47.56666,
                             @"longitude": @-52.71667,
                             @"comments": @"Newfoundland Time, including SE Labrador",
                             @"zone": @"America/St_Johns"
                             },
                         @{
                             @"country_code": @"KN",
                             @"latitude": @17.3,
                             @"longitude": @-62.71667,
                             @"comments": @"",
                             @"zone": @"America/St_Kitts"
                             },
                         @{
                             @"country_code": @"LC",
                             @"latitude": @14.01666,
                             @"longitude": @-61,
                             @"comments": @"",
                             @"zone": @"America/St_Lucia"
                             },
                         @{
                             @"country_code": @"VI",
                             @"latitude": @18.35,
                             @"longitude": @-64.93334,
                             @"comments": @"",
                             @"zone": @"America/St_Thomas"
                             },
                         @{
                             @"country_code": @"VC",
                             @"latitude": @13.15,
                             @"longitude": @-61.23334,
                             @"comments": @"",
                             @"zone": @"America/St_Vincent"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @50.28333,
                             @"longitude": @-107.83334,
                             @"comments": @"Central Standard Time - Saskatchewan - midwest",
                             @"zone": @"America/Swift_Current"
                             },
                         @{
                             @"country_code": @"HN",
                             @"latitude": @14.1,
                             @"longitude": @-87.21667,
                             @"comments": @"",
                             @"zone": @"America/Tegucigalpa"
                             },
                         @{
                             @"country_code": @"GL",
                             @"latitude": @76.56666,
                             @"longitude": @-68.78334,
                             @"comments": @"Thule / Pituffik",
                             @"zone": @"America/Thule"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @48.38333,
                             @"longitude": @-89.25,
                             @"comments": @"Eastern Time - Thunder Bay, Ontario",
                             @"zone": @"America/Thunder_Bay"
                             },
                         @{
                             @"country_code": @"MX",
                             @"latitude": @32.53333,
                             @"longitude": @-117.01667,
                             @"comments": @"US Pacific Time - Baja California near US border",
                             @"zone": @"America/Tijuana"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @43.65,
                             @"longitude": @-79.38334,
                             @"comments": @"Eastern Time - Ontario - most locations",
                             @"zone": @"America/Toronto"
                             },
                         @{
                             @"country_code": @"VG",
                             @"latitude": @18.45,
                             @"longitude": @-64.61667,
                             @"comments": @"",
                             @"zone": @"America/Tortola"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @49.26666,
                             @"longitude": @-123.11667,
                             @"comments": @"Pacific Time - west British Columbia",
                             @"zone": @"America/Vancouver"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @60.71666,
                             @"longitude": @-135.05001,
                             @"comments": @"Pacific Time - south Yukon",
                             @"zone": @"America/Whitehorse"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @49.88333,
                             @"longitude": @-97.15001,
                             @"comments": @"Central Time - Manitoba & west Ontario",
                             @"zone": @"America/Winnipeg"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @59.54694,
                             @"longitude": @-139.72723,
                             @"comments": @"Alaska Time - Alaska panhandle neck",
                             @"zone": @"America/Yakutat"
                             },
                         @{
                             @"country_code": @"CA",
                             @"latitude": @62.44999,
                             @"longitude": @-114.35,
                             @"comments": @"Mountain Time - central Northwest Territories",
                             @"zone": @"America/Yellowknife"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-66.28334,
                             @"longitude": @110.51666,
                             @"comments": @"Casey Station, Bailey Peninsula",
                             @"zone": @"Antarctica/Casey"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-68.58334,
                             @"longitude": @77.96666,
                             @"comments": @"Davis Station, Vestfold Hills",
                             @"zone": @"Antarctica/Davis"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-66.66667,
                             @"longitude": @140.01666,
                             @"comments": @"Dumont-d'Urville Station, Terre Adelie",
                             @"zone": @"Antarctica/DumontDUrville"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-54.5,
                             @"longitude": @158.95,
                             @"comments": @"Macquarie Island",
                             @"zone": @"Antarctica/Macquarie"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-67.6,
                             @"longitude": @62.88333,
                             @"comments": @"Mawson Station, Holme Bay",
                             @"zone": @"Antarctica/Mawson"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-77.83334,
                             @"longitude": @166.6,
                             @"comments": @"McMurdo Station, Ross Island",
                             @"zone": @"Antarctica/McMurdo"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-64.8,
                             @"longitude": @-64.1,
                             @"comments": @"Palmer Station, Anvers Island",
                             @"zone": @"Antarctica/Palmer"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-67.56667,
                             @"longitude": @-68.13334,
                             @"comments": @"Rothera Station, Adelaide Island",
                             @"zone": @"Antarctica/Rothera"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-90,
                             @"longitude": @0,
                             @"comments": @"Amundsen-Scott Station, South Pole",
                             @"zone": @"Antarctica/South_Pole"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-69.00612,
                             @"longitude": @39.59,
                             @"comments": @"Syowa Station, E Ongul I",
                             @"zone": @"Antarctica/Syowa"
                             },
                         @{
                             @"country_code": @"AQ",
                             @"latitude": @-78.40001,
                             @"longitude": @106.89999,
                             @"comments": @"Vostok Station, Lake Vostok",
                             @"zone": @"Antarctica/Vostok"
                             },
                         @{
                             @"country_code": @"SJ",
                             @"latitude": @78,
                             @"longitude": @16,
                             @"comments": @"",
                             @"zone": @"Arctic/Longyearbyen"
                             },
                         @{
                             @"country_code": @"YE",
                             @"latitude": @12.75,
                             @"longitude": @45.2,
                             @"comments": @"",
                             @"zone": @"Asia/Aden"
                             },
                         @{
                             @"country_code": @"KZ",
                             @"latitude": @43.25,
                             @"longitude": @76.95,
                             @"comments": @"most locations",
                             @"zone": @"Asia/Almaty"
                             },
                         @{
                             @"country_code": @"JO",
                             @"latitude": @31.95,
                             @"longitude": @35.93333,
                             @"comments": @"",
                             @"zone": @"Asia/Amman"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @64.75,
                             @"longitude": @177.48333,
                             @"comments": @"Moscow+08 - Bering Sea",
                             @"zone": @"Asia/Anadyr"
                             },
                         @{
                             @"country_code": @"KZ",
                             @"latitude": @44.51666,
                             @"longitude": @50.26666,
                             @"comments": @"Atyrau (Atirau, Gur'yev), Mangghystau (Mankistau)",
                             @"zone": @"Asia/Aqtau"
                             },
                         @{
                             @"country_code": @"KZ",
                             @"latitude": @50.28333,
                             @"longitude": @57.16666,
                             @"comments": @"Aqtobe (Aktobe)",
                             @"zone": @"Asia/Aqtobe"
                             },
                         @{
                             @"country_code": @"TM",
                             @"latitude": @37.95,
                             @"longitude": @58.38333,
                             @"comments": @"",
                             @"zone": @"Asia/Ashgabat"
                             },
                         @{
                             @"country_code": @"IQ",
                             @"latitude": @33.35,
                             @"longitude": @44.41666,
                             @"comments": @"",
                             @"zone": @"Asia/Baghdad"
                             },
                         @{
                             @"country_code": @"BH",
                             @"latitude": @26.38333,
                             @"longitude": @50.58333,
                             @"comments": @"",
                             @"zone": @"Asia/Bahrain"
                             },
                         @{
                             @"country_code": @"AZ",
                             @"latitude": @40.38333,
                             @"longitude": @49.85,
                             @"comments": @"",
                             @"zone": @"Asia/Baku"
                             },
                         @{
                             @"country_code": @"TH",
                             @"latitude": @13.75,
                             @"longitude": @100.51666,
                             @"comments": @"",
                             @"zone": @"Asia/Bangkok"
                             },
                         @{
                             @"country_code": @"LB",
                             @"latitude": @33.88333,
                             @"longitude": @35.5,
                             @"comments": @"",
                             @"zone": @"Asia/Beirut"
                             },
                         @{
                             @"country_code": @"KG",
                             @"latitude": @42.9,
                             @"longitude": @74.6,
                             @"comments": @"",
                             @"zone": @"Asia/Bishkek"
                             },
                         @{
                             @"country_code": @"BN",
                             @"latitude": @4.93333,
                             @"longitude": @114.91666,
                             @"comments": @"",
                             @"zone": @"Asia/Brunei"
                             },
                         @{
                             @"country_code": @"MN",
                             @"latitude": @48.06666,
                             @"longitude": @114.5,
                             @"comments": @"Dornod, Sukhbaatar",
                             @"zone": @"Asia/Choibalsan"
                             },
                         @{
                             @"country_code": @"CN",
                             @"latitude": @29.56666,
                             @"longitude": @106.58333,
                             @"comments": @"central China - Sichuan, Yunnan, Guangxi, Shaanxi, Guizhou, etc.",
                             @"zone": @"Asia/Chongqing"
                             },
                         @{
                             @"country_code": @"LK",
                             @"latitude": @6.93333,
                             @"longitude": @79.85,
                             @"comments": @"",
                             @"zone": @"Asia/Colombo"
                             },
                         @{
                             @"country_code": @"SY",
                             @"latitude": @33.5,
                             @"longitude": @36.3,
                             @"comments": @"",
                             @"zone": @"Asia/Damascus"
                             },
                         @{
                             @"country_code": @"BD",
                             @"latitude": @23.71666,
                             @"longitude": @90.41666,
                             @"comments": @"",
                             @"zone": @"Asia/Dhaka"
                             },
                         @{
                             @"country_code": @"TL",
                             @"latitude": @-8.55,
                             @"longitude": @125.58333,
                             @"comments": @"",
                             @"zone": @"Asia/Dili"
                             },
                         @{
                             @"country_code": @"AE",
                             @"latitude": @25.3,
                             @"longitude": @55.3,
                             @"comments": @"",
                             @"zone": @"Asia/Dubai"
                             },
                         @{
                             @"country_code": @"TJ",
                             @"latitude": @38.58333,
                             @"longitude": @68.8,
                             @"comments": @"",
                             @"zone": @"Asia/Dushanbe"
                             },
                         @{
                             @"country_code": @"PS",
                             @"latitude": @31.5,
                             @"longitude": @34.46666,
                             @"comments": @"Gaza Strip",
                             @"zone": @"Asia/Gaza"
                             },
                         @{
                             @"country_code": @"CN",
                             @"latitude": @45.75,
                             @"longitude": @126.68333,
                             @"comments": @"Heilongjiang (except Mohe), Jilin",
                             @"zone": @"Asia/Harbin"
                             },
                         @{
                             @"country_code": @"PS",
                             @"latitude": @31.53333,
                             @"longitude": @35.095,
                             @"comments": @"West Bank",
                             @"zone": @"Asia/Hebron"
                             },
                         @{
                             @"country_code": @"VN",
                             @"latitude": @10.75,
                             @"longitude": @106.66666,
                             @"comments": @"",
                             @"zone": @"Asia/Ho_Chi_Minh"
                             },
                         @{
                             @"country_code": @"HK",
                             @"latitude": @22.28333,
                             @"longitude": @114.14999,
                             @"comments": @"",
                             @"zone": @"Asia/Hong_Kong"
                             },
                         @{
                             @"country_code": @"MN",
                             @"latitude": @48.01666,
                             @"longitude": @91.64999,
                             @"comments": @"Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan",
                             @"zone": @"Asia/Hovd"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @52.26666,
                             @"longitude": @104.33333,
                             @"comments": @"Moscow+05 - Lake Baikal",
                             @"zone": @"Asia/Irkutsk"
                             },
                         @{
                             @"country_code": @"ID",
                             @"latitude": @-6.16667,
                             @"longitude": @106.8,
                             @"comments": @"Java & Sumatra",
                             @"zone": @"Asia/Jakarta"
                             },
                         @{
                             @"country_code": @"ID",
                             @"latitude": @-2.53334,
                             @"longitude": @140.7,
                             @"comments": @"west New Guinea (Irian Jaya) & Malukus (Moluccas)",
                             @"zone": @"Asia/Jayapura"
                             },
                         @{
                             @"country_code": @"IL",
                             @"latitude": @31.76666,
                             @"longitude": @35.23333,
                             @"comments": @"",
                             @"zone": @"Asia/Jerusalem"
                             },
                         @{
                             @"country_code": @"AF",
                             @"latitude": @34.51666,
                             @"longitude": @69.2,
                             @"comments": @"",
                             @"zone": @"Asia/Kabul"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @53.01666,
                             @"longitude": @158.65,
                             @"comments": @"Moscow+08 - Kamchatka",
                             @"zone": @"Asia/Kamchatka"
                             },
                         @{
                             @"country_code": @"PK",
                             @"latitude": @24.86666,
                             @"longitude": @67.05,
                             @"comments": @"",
                             @"zone": @"Asia/Karachi"
                             },
                         @{
                             @"country_code": @"CN",
                             @"latitude": @39.48333,
                             @"longitude": @75.98333,
                             @"comments": @"west Tibet & Xinjiang",
                             @"zone": @"Asia/Kashgar"
                             },
                         @{
                             @"country_code": @"NP",
                             @"latitude": @27.71666,
                             @"longitude": @85.31666,
                             @"comments": @"",
                             @"zone": @"Asia/Kathmandu"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @62.65638,
                             @"longitude": @135.55388,
                             @"comments": @"Moscow+06 - Tomponsky, Ust-Maysky",
                             @"zone": @"Asia/Khandyga"
                             },
                         @{
                             @"country_code": @"IN",
                             @"latitude": @22.53333,
                             @"longitude": @88.36666,
                             @"comments": @"",
                             @"zone": @"Asia/Kolkata"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @56.01666,
                             @"longitude": @92.83333,
                             @"comments": @"Moscow+04 - Yenisei River",
                             @"zone": @"Asia/Krasnoyarsk"
                             },
                         @{
                             @"country_code": @"MY",
                             @"latitude": @3.16666,
                             @"longitude": @101.7,
                             @"comments": @"peninsular Malaysia",
                             @"zone": @"Asia/Kuala_Lumpur"
                             },
                         @{
                             @"country_code": @"MY",
                             @"latitude": @1.55,
                             @"longitude": @110.33333,
                             @"comments": @"Sabah & Sarawak",
                             @"zone": @"Asia/Kuching"
                             },
                         @{
                             @"country_code": @"KW",
                             @"latitude": @29.33333,
                             @"longitude": @47.98333,
                             @"comments": @"",
                             @"zone": @"Asia/Kuwait"
                             },
                         @{
                             @"country_code": @"MO",
                             @"latitude": @22.23333,
                             @"longitude": @113.58333,
                             @"comments": @"",
                             @"zone": @"Asia/Macau"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @59.56666,
                             @"longitude": @150.8,
                             @"comments": @"Moscow+08 - Magadan",
                             @"zone": @"Asia/Magadan"
                             },
                         @{
                             @"country_code": @"ID",
                             @"latitude": @-5.11667,
                             @"longitude": @119.39999,
                             @"comments": @"east & south Borneo, Sulawesi (Celebes), Bali, Nusa Tengarra, west Timor",
                             @"zone": @"Asia/Makassar"
                             },
                         @{
                             @"country_code": @"PH",
                             @"latitude": @14.58333,
                             @"longitude": @121,
                             @"comments": @"",
                             @"zone": @"Asia/Manila"
                             },
                         @{
                             @"country_code": @"OM",
                             @"latitude": @23.6,
                             @"longitude": @58.58333,
                             @"comments": @"",
                             @"zone": @"Asia/Muscat"
                             },
                         @{
                             @"country_code": @"CY",
                             @"latitude": @35.16666,
                             @"longitude": @33.36666,
                             @"comments": @"",
                             @"zone": @"Asia/Nicosia"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @53.75,
                             @"longitude": @87.11666,
                             @"comments": @"Moscow+03 - Novokuznetsk",
                             @"zone": @"Asia/Novokuznetsk"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @55.03333,
                             @"longitude": @82.91666,
                             @"comments": @"Moscow+03 - Novosibirsk",
                             @"zone": @"Asia/Novosibirsk"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @55,
                             @"longitude": @73.4,
                             @"comments": @"Moscow+03 - west Siberia",
                             @"zone": @"Asia/Omsk"
                             },
                         @{
                             @"country_code": @"KZ",
                             @"latitude": @51.21666,
                             @"longitude": @51.35,
                             @"comments": @"West Kazakhstan",
                             @"zone": @"Asia/Oral"
                             },
                         @{
                             @"country_code": @"KH",
                             @"latitude": @11.55,
                             @"longitude": @104.91666,
                             @"comments": @"",
                             @"zone": @"Asia/Phnom_Penh"
                             },
                         @{
                             @"country_code": @"ID",
                             @"latitude": @-0.033339999999995,
                             @"longitude": @109.33333,
                             @"comments": @"west & central Borneo",
                             @"zone": @"Asia/Pontianak"
                             },
                         @{
                             @"country_code": @"KP",
                             @"latitude": @39.01666,
                             @"longitude": @125.75,
                             @"comments": @"",
                             @"zone": @"Asia/Pyongyang"
                             },
                         @{
                             @"country_code": @"QA",
                             @"latitude": @25.28333,
                             @"longitude": @51.53333,
                             @"comments": @"",
                             @"zone": @"Asia/Qatar"
                             },
                         @{
                             @"country_code": @"KZ",
                             @"latitude": @44.8,
                             @"longitude": @65.46666,
                             @"comments": @"Qyzylorda (Kyzylorda, Kzyl-Orda)",
                             @"zone": @"Asia/Qyzylorda"
                             },
                         @{
                             @"country_code": @"MM",
                             @"latitude": @16.78333,
                             @"longitude": @96.16666,
                             @"comments": @"",
                             @"zone": @"Asia/Rangoon"
                             },
                         @{
                             @"country_code": @"SA",
                             @"latitude": @24.63333,
                             @"longitude": @46.71666,
                             @"comments": @"",
                             @"zone": @"Asia/Riyadh"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @46.96666,
                             @"longitude": @142.7,
                             @"comments": @"Moscow+07 - Sakhalin Island",
                             @"zone": @"Asia/Sakhalin"
                             },
                         @{
                             @"country_code": @"UZ",
                             @"latitude": @39.66666,
                             @"longitude": @66.8,
                             @"comments": @"west Uzbekistan",
                             @"zone": @"Asia/Samarkand"
                             },
                         @{
                             @"country_code": @"KR",
                             @"latitude": @37.55,
                             @"longitude": @126.96666,
                             @"comments": @"",
                             @"zone": @"Asia/Seoul"
                             },
                         @{
                             @"country_code": @"CN",
                             @"latitude": @31.23333,
                             @"longitude": @121.46666,
                             @"comments": @"east China - Beijing, Guangdong, Shanghai, etc.",
                             @"zone": @"Asia/Shanghai"
                             },
                         @{
                             @"country_code": @"SG",
                             @"latitude": @1.28333,
                             @"longitude": @103.85,
                             @"comments": @"",
                             @"zone": @"Asia/Singapore"
                             },
                         @{
                             @"country_code": @"TW",
                             @"latitude": @25.05,
                             @"longitude": @121.5,
                             @"comments": @"",
                             @"zone": @"Asia/Taipei"
                             },
                         @{
                             @"country_code": @"UZ",
                             @"latitude": @41.33333,
                             @"longitude": @69.3,
                             @"comments": @"east Uzbekistan",
                             @"zone": @"Asia/Tashkent"
                             },
                         @{
                             @"country_code": @"GE",
                             @"latitude": @41.71666,
                             @"longitude": @44.81666,
                             @"comments": @"",
                             @"zone": @"Asia/Tbilisi"
                             },
                         @{
                             @"country_code": @"IR",
                             @"latitude": @35.66666,
                             @"longitude": @51.43333,
                             @"comments": @"",
                             @"zone": @"Asia/Tehran"
                             },
                         @{
                             @"country_code": @"BT",
                             @"latitude": @27.46666,
                             @"longitude": @89.64999,
                             @"comments": @"",
                             @"zone": @"Asia/Thimphu"
                             },
                         @{
                             @"country_code": @"JP",
                             @"latitude": @35.65444,
                             @"longitude": @139.74472,
                             @"comments": @"",
                             @"zone": @"Asia/Tokyo"
                             },
                         @{
                             @"country_code": @"MN",
                             @"latitude": @47.91666,
                             @"longitude": @106.88333,
                             @"comments": @"most locations",
                             @"zone": @"Asia/Ulaanbaatar"
                             },
                         @{
                             @"country_code": @"CN",
                             @"latitude": @43.8,
                             @"longitude": @87.58333,
                             @"comments": @"most of Tibet & Xinjiang",
                             @"zone": @"Asia/Urumqi"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @64.56027,
                             @"longitude": @143.22666,
                             @"comments": @"Moscow+07 - Oymyakonsky",
                             @"zone": @"Asia/Ust-Nera"
                             },
                         @{
                             @"country_code": @"LA",
                             @"latitude": @17.96666,
                             @"longitude": @102.6,
                             @"comments": @"",
                             @"zone": @"Asia/Vientiane"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @43.16666,
                             @"longitude": @131.93333,
                             @"comments": @"Moscow+07 - Amur River",
                             @"zone": @"Asia/Vladivostok"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @62,
                             @"longitude": @129.66666,
                             @"comments": @"Moscow+06 - Lena River",
                             @"zone": @"Asia/Yakutsk"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @56.85,
                             @"longitude": @60.6,
                             @"comments": @"Moscow+02 - Urals",
                             @"zone": @"Asia/Yekaterinburg"
                             },
                         @{
                             @"country_code": @"AM",
                             @"latitude": @40.18333,
                             @"longitude": @44.5,
                             @"comments": @"",
                             @"zone": @"Asia/Yerevan"
                             },
                         @{
                             @"country_code": @"PT",
                             @"latitude": @37.73333,
                             @"longitude": @-25.66667,
                             @"comments": @"Azores",
                             @"zone": @"Atlantic/Azores"
                             },
                         @{
                             @"country_code": @"BM",
                             @"latitude": @32.28333,
                             @"longitude": @-64.76667,
                             @"comments": @"",
                             @"zone": @"Atlantic/Bermuda"
                             },
                         @{
                             @"country_code": @"ES",
                             @"latitude": @28.1,
                             @"longitude": @-15.4,
                             @"comments": @"Canary Islands",
                             @"zone": @"Atlantic/Canary"
                             },
                         @{
                             @"country_code": @"CV",
                             @"latitude": @14.91666,
                             @"longitude": @-23.51667,
                             @"comments": @"",
                             @"zone": @"Atlantic/Cape_Verde"
                             },
                         @{
                             @"country_code": @"FO",
                             @"latitude": @62.01666,
                             @"longitude": @-6.76667,
                             @"comments": @"",
                             @"zone": @"Atlantic/Faroe"
                             },
                         @{
                             @"country_code": @"PT",
                             @"latitude": @32.63333,
                             @"longitude": @-16.9,
                             @"comments": @"Madeira Islands",
                             @"zone": @"Atlantic/Madeira"
                             },
                         @{
                             @"country_code": @"IS",
                             @"latitude": @64.15,
                             @"longitude": @-21.85,
                             @"comments": @"",
                             @"zone": @"Atlantic/Reykjavik"
                             },
                         @{
                             @"country_code": @"GS",
                             @"latitude": @-54.26667,
                             @"longitude": @-36.53334,
                             @"comments": @"",
                             @"zone": @"Atlantic/South_Georgia"
                             },
                         @{
                             @"country_code": @"SH",
                             @"latitude": @-15.91667,
                             @"longitude": @-5.7,
                             @"comments": @"",
                             @"zone": @"Atlantic/St_Helena"
                             },
                         @{
                             @"country_code": @"FK",
                             @"latitude": @-51.70001,
                             @"longitude": @-57.85,
                             @"comments": @"",
                             @"zone": @"Atlantic/Stanley"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-34.91667,
                             @"longitude": @138.58333,
                             @"comments": @"South Australia",
                             @"zone": @"Australia/Adelaide"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-27.46667,
                             @"longitude": @153.03333,
                             @"comments": @"Queensland - most locations",
                             @"zone": @"Australia/Brisbane"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-31.95,
                             @"longitude": @141.45,
                             @"comments": @"New South Wales - Yancowinna",
                             @"zone": @"Australia/Broken_Hill"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-39.93334,
                             @"longitude": @143.86666,
                             @"comments": @"Tasmania - King Island",
                             @"zone": @"Australia/Currie"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-12.46667,
                             @"longitude": @130.83333,
                             @"comments": @"Northern Territory",
                             @"zone": @"Australia/Darwin"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-31.71667,
                             @"longitude": @128.86666,
                             @"comments": @"Western Australia - Eucla area",
                             @"zone": @"Australia/Eucla"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-42.88334,
                             @"longitude": @147.31666,
                             @"comments": @"Tasmania - most locations",
                             @"zone": @"Australia/Hobart"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-20.26667,
                             @"longitude": @149,
                             @"comments": @"Queensland - Holiday Islands",
                             @"zone": @"Australia/Lindeman"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-31.55,
                             @"longitude": @159.08333,
                             @"comments": @"Lord Howe Island",
                             @"zone": @"Australia/Lord_Howe"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-37.81667,
                             @"longitude": @144.96666,
                             @"comments": @"Victoria",
                             @"zone": @"Australia/Melbourne"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-31.95,
                             @"longitude": @115.85,
                             @"comments": @"Western Australia - most locations",
                             @"zone": @"Australia/Perth"
                             },
                         @{
                             @"country_code": @"AU",
                             @"latitude": @-33.86667,
                             @"longitude": @151.21666,
                             @"comments": @"New South Wales - most locations",
                             @"zone": @"Australia/Sydney"
                             },
                         @{
                             @"country_code": @"NL",
                             @"latitude": @52.36666,
                             @"longitude": @4.9,
                             @"comments": @"",
                             @"zone": @"Europe/Amsterdam"
                             },
                         @{
                             @"country_code": @"AD",
                             @"latitude": @42.5,
                             @"longitude": @1.51666,
                             @"comments": @"",
                             @"zone": @"Europe/Andorra"
                             },
                         @{
                             @"country_code": @"GR",
                             @"latitude": @37.96666,
                             @"longitude": @23.71666,
                             @"comments": @"",
                             @"zone": @"Europe/Athens"
                             },
                         @{
                             @"country_code": @"RS",
                             @"latitude": @44.83333,
                             @"longitude": @20.5,
                             @"comments": @"",
                             @"zone": @"Europe/Belgrade"
                             },
                         @{
                             @"country_code": @"DE",
                             @"latitude": @52.5,
                             @"longitude": @13.36666,
                             @"comments": @"most locations",
                             @"zone": @"Europe/Berlin"
                             },
                         @{
                             @"country_code": @"SK",
                             @"latitude": @48.15,
                             @"longitude": @17.11666,
                             @"comments": @"",
                             @"zone": @"Europe/Bratislava"
                             },
                         @{
                             @"country_code": @"BE",
                             @"latitude": @50.83333,
                             @"longitude": @4.33333,
                             @"comments": @"",
                             @"zone": @"Europe/Brussels"
                             },
                         @{
                             @"country_code": @"RO",
                             @"latitude": @44.43333,
                             @"longitude": @26.1,
                             @"comments": @"",
                             @"zone": @"Europe/Bucharest"
                             },
                         @{
                             @"country_code": @"HU",
                             @"latitude": @47.5,
                             @"longitude": @19.08333,
                             @"comments": @"",
                             @"zone": @"Europe/Budapest"
                             },
                         @{
                             @"country_code": @"DE",
                             @"latitude": @47.69999,
                             @"longitude": @8.68333,
                             @"comments": @"Busingen",
                             @"zone": @"Europe/Busingen"
                             },
                         @{
                             @"country_code": @"MD",
                             @"latitude": @47,
                             @"longitude": @28.83333,
                             @"comments": @"",
                             @"zone": @"Europe/Chisinau"
                             },
                         @{
                             @"country_code": @"DK",
                             @"latitude": @55.66666,
                             @"longitude": @12.58333,
                             @"comments": @"",
                             @"zone": @"Europe/Copenhagen"
                             },
                         @{
                             @"country_code": @"IE",
                             @"latitude": @53.33333,
                             @"longitude": @-6.25,
                             @"comments": @"",
                             @"zone": @"Europe/Dublin"
                             },
                         @{
                             @"country_code": @"GI",
                             @"latitude": @36.13333,
                             @"longitude": @-5.35,
                             @"comments": @"",
                             @"zone": @"Europe/Gibraltar"
                             },
                         @{
                             @"country_code": @"GG",
                             @"latitude": @49.44999,
                             @"longitude": @-2.53334,
                             @"comments": @"",
                             @"zone": @"Europe/Guernsey"
                             },
                         @{
                             @"country_code": @"FI",
                             @"latitude": @60.16666,
                             @"longitude": @24.96666,
                             @"comments": @"",
                             @"zone": @"Europe/Helsinki"
                             },
                         @{
                             @"country_code": @"IM",
                             @"latitude": @54.15,
                             @"longitude": @-4.46667,
                             @"comments": @"",
                             @"zone": @"Europe/Isle_of_Man"
                             },
                         @{
                             @"country_code": @"TR",
                             @"latitude": @41.01666,
                             @"longitude": @28.96666,
                             @"comments": @"",
                             @"zone": @"Europe/Istanbul"
                             },
                         @{
                             @"country_code": @"JE",
                             @"latitude": @49.19999,
                             @"longitude": @-2.11667,
                             @"comments": @"",
                             @"zone": @"Europe/Jersey"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @54.71666,
                             @"longitude": @20.5,
                             @"comments": @"Moscow-01 - Kaliningrad",
                             @"zone": @"Europe/Kaliningrad"
                             },
                         @{
                             @"country_code": @"UA",
                             @"latitude": @50.43333,
                             @"longitude": @30.51666,
                             @"comments": @"most locations",
                             @"zone": @"Europe/Kiev"
                             },
                         @{
                             @"country_code": @"PT",
                             @"latitude": @38.71666,
                             @"longitude": @-9.13334,
                             @"comments": @"mainland",
                             @"zone": @"Europe/Lisbon"
                             },
                         @{
                             @"country_code": @"SI",
                             @"latitude": @46.05,
                             @"longitude": @14.51666,
                             @"comments": @"",
                             @"zone": @"Europe/Ljubljana"
                             },
                         @{
                             @"country_code": @"GB",
                             @"latitude": @51.50833,
                             @"longitude": @-0.12528,
                             @"comments": @"",
                             @"zone": @"Europe/London"
                             },
                         @{
                             @"country_code": @"LU",
                             @"latitude": @49.6,
                             @"longitude": @6.15,
                             @"comments": @"",
                             @"zone": @"Europe/Luxembourg"
                             },
                         @{
                             @"country_code": @"ES",
                             @"latitude": @40.4,
                             @"longitude": @-3.68334,
                             @"comments": @"mainland",
                             @"zone": @"Europe/Madrid"
                             },
                         @{
                             @"country_code": @"MT",
                             @"latitude": @35.9,
                             @"longitude": @14.51666,
                             @"comments": @"",
                             @"zone": @"Europe/Malta"
                             },
                         @{
                             @"country_code": @"AX",
                             @"latitude": @60.1,
                             @"longitude": @19.95,
                             @"comments": @"",
                             @"zone": @"Europe/Mariehamn"
                             },
                         @{
                             @"country_code": @"BY",
                             @"latitude": @53.9,
                             @"longitude": @27.56666,
                             @"comments": @"",
                             @"zone": @"Europe/Minsk"
                             },
                         @{
                             @"country_code": @"MC",
                             @"latitude": @43.69999,
                             @"longitude": @7.38333,
                             @"comments": @"",
                             @"zone": @"Europe/Monaco"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @55.75,
                             @"longitude": @37.58333,
                             @"comments": @"Moscow+00 - west Russia",
                             @"zone": @"Europe/Moscow"
                             },
                         @{
                             @"country_code": @"NO",
                             @"latitude": @59.91666,
                             @"longitude": @10.75,
                             @"comments": @"",
                             @"zone": @"Europe/Oslo"
                             },
                         @{
                             @"country_code": @"FR",
                             @"latitude": @48.86666,
                             @"longitude": @2.33333,
                             @"comments": @"",
                             @"zone": @"Europe/Paris"
                             },
                         @{
                             @"country_code": @"ME",
                             @"latitude": @42.43333,
                             @"longitude": @19.26666,
                             @"comments": @"",
                             @"zone": @"Europe/Podgorica"
                             },
                         @{
                             @"country_code": @"CZ",
                             @"latitude": @50.08333,
                             @"longitude": @14.43333,
                             @"comments": @"",
                             @"zone": @"Europe/Prague"
                             },
                         @{
                             @"country_code": @"LV",
                             @"latitude": @56.94999,
                             @"longitude": @24.1,
                             @"comments": @"",
                             @"zone": @"Europe/Riga"
                             },
                         @{
                             @"country_code": @"IT",
                             @"latitude": @41.9,
                             @"longitude": @12.48333,
                             @"comments": @"",
                             @"zone": @"Europe/Rome"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @53.19999,
                             @"longitude": @50.15,
                             @"comments": @"Moscow+00 - Samara, Udmurtia",
                             @"zone": @"Europe/Samara"
                             },
                         @{
                             @"country_code": @"SM",
                             @"latitude": @43.91666,
                             @"longitude": @12.46666,
                             @"comments": @"",
                             @"zone": @"Europe/San_Marino"
                             },
                         @{
                             @"country_code": @"BA",
                             @"latitude": @43.86666,
                             @"longitude": @18.41666,
                             @"comments": @"",
                             @"zone": @"Europe/Sarajevo"
                             },
                         @{
                             @"country_code": @"UA",
                             @"latitude": @44.94999,
                             @"longitude": @34.1,
                             @"comments": @"central Crimea",
                             @"zone": @"Europe/Simferopol"
                             },
                         @{
                             @"country_code": @"MK",
                             @"latitude": @41.98333,
                             @"longitude": @21.43333,
                             @"comments": @"",
                             @"zone": @"Europe/Skopje"
                             },
                         @{
                             @"country_code": @"BG",
                             @"latitude": @42.68333,
                             @"longitude": @23.31666,
                             @"comments": @"",
                             @"zone": @"Europe/Sofia"
                             },
                         @{
                             @"country_code": @"SE",
                             @"latitude": @59.33333,
                             @"longitude": @18.05,
                             @"comments": @"",
                             @"zone": @"Europe/Stockholm"
                             },
                         @{
                             @"country_code": @"EE",
                             @"latitude": @59.41666,
                             @"longitude": @24.75,
                             @"comments": @"",
                             @"zone": @"Europe/Tallinn"
                             },
                         @{
                             @"country_code": @"AL",
                             @"latitude": @41.33333,
                             @"longitude": @19.83333,
                             @"comments": @"",
                             @"zone": @"Europe/Tirane"
                             },
                         @{
                             @"country_code": @"UA",
                             @"latitude": @48.61666,
                             @"longitude": @22.3,
                             @"comments": @"Ruthenia",
                             @"zone": @"Europe/Uzhgorod"
                             },
                         @{
                             @"country_code": @"LI",
                             @"latitude": @47.15,
                             @"longitude": @9.51666,
                             @"comments": @"",
                             @"zone": @"Europe/Vaduz"
                             },
                         @{
                             @"country_code": @"VA",
                             @"latitude": @41.90222,
                             @"longitude": @12.45305,
                             @"comments": @"",
                             @"zone": @"Europe/Vatican"
                             },
                         @{
                             @"country_code": @"AT",
                             @"latitude": @48.21666,
                             @"longitude": @16.33333,
                             @"comments": @"",
                             @"zone": @"Europe/Vienna"
                             },
                         @{
                             @"country_code": @"LT",
                             @"latitude": @54.68333,
                             @"longitude": @25.31666,
                             @"comments": @"",
                             @"zone": @"Europe/Vilnius"
                             },
                         @{
                             @"country_code": @"RU",
                             @"latitude": @48.73333,
                             @"longitude": @44.41666,
                             @"comments": @"Moscow+00 - Caspian Sea",
                             @"zone": @"Europe/Volgograd"
                             },
                         @{
                             @"country_code": @"PL",
                             @"latitude": @52.25,
                             @"longitude": @21,
                             @"comments": @"",
                             @"zone": @"Europe/Warsaw"
                             },
                         @{
                             @"country_code": @"HR",
                             @"latitude": @45.8,
                             @"longitude": @15.96666,
                             @"comments": @"",
                             @"zone": @"Europe/Zagreb"
                             },
                         @{
                             @"country_code": @"UA",
                             @"latitude": @47.83333,
                             @"longitude": @35.16666,
                             @"comments": @"Zaporozh'ye, E Lugansk / Zaporizhia, E Luhansk",
                             @"zone": @"Europe/Zaporozhye"
                             },
                         @{
                             @"country_code": @"CH",
                             @"latitude": @47.38333,
                             @"longitude": @8.53333,
                             @"comments": @"",
                             @"zone": @"Europe/Zurich"
                             },
                         @{
                             @"country_code": @"MG",
                             @"latitude": @-18.91667,
                             @"longitude": @47.51666,
                             @"comments": @"",
                             @"zone": @"Indian/Antananarivo"
                             },
                         @{
                             @"country_code": @"IO",
                             @"latitude": @-7.33334,
                             @"longitude": @72.41666,
                             @"comments": @"",
                             @"zone": @"Indian/Chagos"
                             },
                         @{
                             @"country_code": @"CX",
                             @"latitude": @-10.41667,
                             @"longitude": @105.71666,
                             @"comments": @"",
                             @"zone": @"Indian/Christmas"
                             },
                         @{
                             @"country_code": @"CC",
                             @"latitude": @-12.16667,
                             @"longitude": @96.91666,
                             @"comments": @"",
                             @"zone": @"Indian/Cocos"
                             },
                         @{
                             @"country_code": @"KM",
                             @"latitude": @-11.68334,
                             @"longitude": @43.26666,
                             @"comments": @"",
                             @"zone": @"Indian/Comoro"
                             },
                         @{
                             @"country_code": @"TF",
                             @"latitude": @-49.35278,
                             @"longitude": @70.2175,
                             @"comments": @"",
                             @"zone": @"Indian/Kerguelen"
                             },
                         @{
                             @"country_code": @"SC",
                             @"latitude": @-4.66667,
                             @"longitude": @55.46666,
                             @"comments": @"",
                             @"zone": @"Indian/Mahe"
                             },
                         @{
                             @"country_code": @"MV",
                             @"latitude": @4.16666,
                             @"longitude": @73.5,
                             @"comments": @"",
                             @"zone": @"Indian/Maldives"
                             },
                         @{
                             @"country_code": @"MU",
                             @"latitude": @-20.16667,
                             @"longitude": @57.5,
                             @"comments": @"",
                             @"zone": @"Indian/Mauritius"
                             },
                         @{
                             @"country_code": @"YT",
                             @"latitude": @-12.78334,
                             @"longitude": @45.23333,
                             @"comments": @"",
                             @"zone": @"Indian/Mayotte"
                             },
                         @{
                             @"country_code": @"RE",
                             @"latitude": @-20.86667,
                             @"longitude": @55.46666,
                             @"comments": @"",
                             @"zone": @"Indian/Reunion"
                             },
                         @{
                             @"country_code": @"WS",
                             @"latitude": @-13.83334,
                             @"longitude": @-171.73334,
                             @"comments": @"",
                             @"zone": @"Pacific/Apia"
                             },
                         @{
                             @"country_code": @"NZ",
                             @"latitude": @-36.86667,
                             @"longitude": @174.76666,
                             @"comments": @"most locations",
                             @"zone": @"Pacific/Auckland"
                             },
                         @{
                             @"country_code": @"NZ",
                             @"latitude": @-43.95,
                             @"longitude": @-176.55001,
                             @"comments": @"Chatham Islands",
                             @"zone": @"Pacific/Chatham"
                             },
                         @{
                             @"country_code": @"FM",
                             @"latitude": @7.41666,
                             @"longitude": @151.78333,
                             @"comments": @"Chuuk (Truk) and Yap",
                             @"zone": @"Pacific/Chuuk"
                             },
                         @{
                             @"country_code": @"CL",
                             @"latitude": @-27.15,
                             @"longitude": @-109.43334,
                             @"comments": @"Easter Island & Sala y Gomez",
                             @"zone": @"Pacific/Easter"
                             },
                         @{
                             @"country_code": @"VU",
                             @"latitude": @-17.66667,
                             @"longitude": @168.41666,
                             @"comments": @"",
                             @"zone": @"Pacific/Efate"
                             },
                         @{
                             @"country_code": @"KI",
                             @"latitude": @-3.13334,
                             @"longitude": @-171.08334,
                             @"comments": @"Phoenix Islands",
                             @"zone": @"Pacific/Enderbury"
                             },
                         @{
                             @"country_code": @"TK",
                             @"latitude": @-9.36667,
                             @"longitude": @-171.23334,
                             @"comments": @"",
                             @"zone": @"Pacific/Fakaofo"
                             },
                         @{
                             @"country_code": @"FJ",
                             @"latitude": @-18.13334,
                             @"longitude": @178.41666,
                             @"comments": @"",
                             @"zone": @"Pacific/Fiji"
                             },
                         @{
                             @"country_code": @"TV",
                             @"latitude": @-8.51667,
                             @"longitude": @179.21666,
                             @"comments": @"",
                             @"zone": @"Pacific/Funafuti"
                             },
                         @{
                             @"country_code": @"EC",
                             @"latitude": @-0.90000000000001,
                             @"longitude": @-89.6,
                             @"comments": @"Galapagos Islands",
                             @"zone": @"Pacific/Galapagos"
                             },
                         @{
                             @"country_code": @"PF",
                             @"latitude": @-23.13334,
                             @"longitude": @-134.95,
                             @"comments": @"Gambier Islands",
                             @"zone": @"Pacific/Gambier"
                             },
                         @{
                             @"country_code": @"SB",
                             @"latitude": @-9.53334,
                             @"longitude": @160.2,
                             @"comments": @"",
                             @"zone": @"Pacific/Guadalcanal"
                             },
                         @{
                             @"country_code": @"GU",
                             @"latitude": @13.46666,
                             @"longitude": @144.75,
                             @"comments": @"",
                             @"zone": @"Pacific/Guam"
                             },
                         @{
                             @"country_code": @"US",
                             @"latitude": @21.30694,
                             @"longitude": @-157.85834,
                             @"comments": @"Hawaii",
                             @"zone": @"Pacific/Honolulu"
                             },
                         @{
                             @"country_code": @"UM",
                             @"latitude": @16.75,
                             @"longitude": @-169.51667,
                             @"comments": @"Johnston Atoll",
                             @"zone": @"Pacific/Johnston"
                             },
                         @{
                             @"country_code": @"KI",
                             @"latitude": @1.86666,
                             @"longitude": @-157.33334,
                             @"comments": @"Line Islands",
                             @"zone": @"Pacific/Kiritimati"
                             },
                         @{
                             @"country_code": @"FM",
                             @"latitude": @5.31666,
                             @"longitude": @162.98333,
                             @"comments": @"Kosrae",
                             @"zone": @"Pacific/Kosrae"
                             },
                         @{
                             @"country_code": @"MH",
                             @"latitude": @9.08333,
                             @"longitude": @167.33333,
                             @"comments": @"Kwajalein",
                             @"zone": @"Pacific/Kwajalein"
                             },
                         @{
                             @"country_code": @"MH",
                             @"latitude": @7.15,
                             @"longitude": @171.2,
                             @"comments": @"most locations",
                             @"zone": @"Pacific/Majuro"
                             },
                         @{
                             @"country_code": @"PF",
                             @"latitude": @-9,
                             @"longitude": @-139.5,
                             @"comments": @"Marquesas Islands",
                             @"zone": @"Pacific/Marquesas"
                             },
                         @{
                             @"country_code": @"UM",
                             @"latitude": @28.21666,
                             @"longitude": @-177.36667,
                             @"comments": @"Midway Islands",
                             @"zone": @"Pacific/Midway"
                             },
                         @{
                             @"country_code": @"NR",
                             @"latitude": @-0.51667,
                             @"longitude": @166.91666,
                             @"comments": @"",
                             @"zone": @"Pacific/Nauru"
                             },
                         @{
                             @"country_code": @"NU",
                             @"latitude": @-19.01667,
                             @"longitude": @-169.91667,
                             @"comments": @"",
                             @"zone": @"Pacific/Niue"
                             },
                         @{
                             @"country_code": @"NF",
                             @"latitude": @-29.05,
                             @"longitude": @167.96666,
                             @"comments": @"",
                             @"zone": @"Pacific/Norfolk"
                             },
                         @{
                             @"country_code": @"NC",
                             @"latitude": @-22.26667,
                             @"longitude": @166.45,
                             @"comments": @"",
                             @"zone": @"Pacific/Noumea"
                             },
                         @{
                             @"country_code": @"AS",
                             @"latitude": @-14.26667,
                             @"longitude": @-170.7,
                             @"comments": @"",
                             @"zone": @"Pacific/Pago_Pago"
                             },
                         @{
                             @"country_code": @"PW",
                             @"latitude": @7.33333,
                             @"longitude": @134.48333,
                             @"comments": @"",
                             @"zone": @"Pacific/Palau"
                             },
                         @{
                             @"country_code": @"PN",
                             @"latitude": @-25.06667,
                             @"longitude": @-130.08334,
                             @"comments": @"",
                             @"zone": @"Pacific/Pitcairn"
                             },
                         @{
                             @"country_code": @"FM",
                             @"latitude": @6.96666,
                             @"longitude": @158.21666,
                             @"comments": @"Pohnpei (Ponape)",
                             @"zone": @"Pacific/Pohnpei"
                             },
                         @{
                             @"country_code": @"PG",
                             @"latitude": @-9.5,
                             @"longitude": @147.16666,
                             @"comments": @"",
                             @"zone": @"Pacific/Port_Moresby"
                             },
                         @{
                             @"country_code": @"CK",
                             @"latitude": @-21.23334,
                             @"longitude": @-159.76667,
                             @"comments": @"",
                             @"zone": @"Pacific/Rarotonga"
                             },
                         @{
                             @"country_code": @"MP",
                             @"latitude": @15.2,
                             @"longitude": @145.75,
                             @"comments": @"",
                             @"zone": @"Pacific/Saipan"
                             },
                         @{
                             @"country_code": @"PF",
                             @"latitude": @-17.53334,
                             @"longitude": @-149.56667,
                             @"comments": @"Society Islands",
                             @"zone": @"Pacific/Tahiti"
                             },
                         @{
                             @"country_code": @"KI",
                             @"latitude": @1.41666,
                             @"longitude": @173,
                             @"comments": @"Gilbert Islands",
                             @"zone": @"Pacific/Tarawa"
                             },
                         @{
                             @"country_code": @"TO",
                             @"latitude": @-21.16667,
                             @"longitude": @-175.16667,
                             @"comments": @"",
                             @"zone": @"Pacific/Tongatapu"
                             },
                         @{
                             @"country_code": @"UM",
                             @"latitude": @19.28333,
                             @"longitude": @166.61666,
                             @"comments": @"Wake Island",
                             @"zone": @"Pacific/Wake"
                             },
                         @{
                             @"country_code": @"WF",
                             @"latitude": @-13.3,
                             @"longitude": @-176.16667,
                             @"comments": @"",
                             @"zone": @"Pacific/Wallis"
                             },
                         @{
                             @"country_code": @"??",
                             @"latitude": @0,
                             @"longitude": @0,
                             @"comments": @"",
                             @"zone": @"UTC"
                             }
                         ];
        //[self importDataBaseFromFile:@"timezonesDB.json"];
        
    }
    
    return _timeZonesDB;
}

/*
 Import from DB
 */
- (NSArray *)importDataBaseFromFile:(NSString *)fileName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    NSAssert(jsonData.length != 0, @"timezonesDB.json not found in app bundle");
    
    NSError *error = nil;
    NSArray *timeZones = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:NSJSONReadingAllowFragments
                                                           error:&error];
    
    NSAssert(error == nil, @"JSON parsing failed");
    return timeZones;
}

/*
 Calculates the closest distance from source
 */
- (NSDictionary *)closesZoneInfoWithLocation:(CLLocation *)location source:(NSArray *)source {
    CLLocationDistance closestDistance = DBL_MAX;
    NSDictionary *closestZoneInfo = nil;
    
    for (NSDictionary *locationInfo in source) {
        
        double latitude = [locationInfo[@"latitude"] doubleValue];
        double longitude = [locationInfo[@"longitude"] doubleValue];
        
        CLLocation *zoneLocation = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        CLLocationDistance distance = [location distanceFromLocation:zoneLocation];
        if (distance < closestDistance) {
            closestDistance = distance;
            closestZoneInfo = locationInfo;
        }
    }
    return closestZoneInfo;
}

/*
 Filtering the whole DB with the country code
 */

- (NSArray *)filteredTimeZonesWithCountyCode:(NSString *)countryCode {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"country_code LIKE %@", countryCode];
    return [self.timeZonesDB filteredArrayUsingPredicate:predicate];
}

/*
 Timezone from dict
 */
- (NSTimeZone *)timeZoneWithDictionary:(NSDictionary *)zoneInfo {
    NSString *zoneName = zoneInfo[@"zone"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:zoneName];
    return timeZone;
}

#pragma mark - Singleton
+ (APTimeZones *)sharedInstance {
    static dispatch_once_t pred;
    static APTimeZones *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

@end
