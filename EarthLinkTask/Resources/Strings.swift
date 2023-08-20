//
//  Strings.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 19/08/2023.
//

import Foundation
class Strings {
class func getText(stringKey: String) -> String {
    var text = ""
    if Language.currentLanguage().contains(AR_LANG) {
        text = dictionaryAR[stringKey] ?? stringKey
    } else {
        text = dictionaryEN[stringKey] ?? stringKey
    }
    return text
}
private static let dictionaryAR: [ String: String ] =
["error": "خطأ",
 "genericError": "حدث خطأ اثناء الإتصال بالخادم برجاء المحاولة مرة اخري!",
 "search": "بحث",
 "reload": "إعادة المحاولة",
 "noInternet":"برجاء التاكد من الإتصال بالإنترنت!",
  "topApps":"الأعلي تقييما",
 "appOfTheDay":"تطبيق اليوم",
"editorsChoice":"إختيار المحررين",
"mustPlayGames":"ألعاب لا بد من تجربتها",
 "featuredApps":"تطبيقات مميزة",
 "cancel" :"إلغاء",
 "ratingCount":"تقييم",
 "yearsOld":"سنة",
 "age":"العمر",
 "GET" :"تحميل"
 ]

    private static let dictionaryEN: [ String: String ] =
    ["search": "Search",
     "GET":"GET",
     "ratingCount":"Ratings",
     "age":"Age",
     "yearsOld":"Years Old",
     "topApps":"Top Apps Now",
      "appOfTheDay":"App of the Day",
      "featuredApps":"Featured Apps",
     "editorsChoice":"Editor's Choice",
    "mustPlayGames":"Must-Play Games",
   "genericError" : "Something went wrong.Please try again later!",
     "noInternet":"Please make sure that you are connected to internet",
     "error": "Error",
     "reload": "Reload",
     "cancel" :"Cancel"
     ]


}
