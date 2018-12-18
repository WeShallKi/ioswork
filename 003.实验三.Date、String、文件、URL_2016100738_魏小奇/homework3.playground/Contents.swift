//: Playground - noun: a place where people can play

import UIKit
/*
 1.    显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
 a)    显示中文需要设置locale
 */
let time = Date()
func transformDate(date:Date,zone:Int = 0) -> String
{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "zh_cn");
    dateFormatter.dateFormat = "yyyy年MM月dd日EEEE aa hh:mm"
    if zone >= 0{
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    }else{
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    let dateTime = dateFormatter.string(from: date)
    return dateTime
}
let beijing = transformDate(date: time, zone: 8)
print(beijing)
let tokyo = transformDate(date: time, zone: 9)
print(tokyo)
let newYork = transformDate(date: time,zone: -5)
print(newYork)
let london = transformDate(date: time)
print(london)
/*
 1.    处理字符串
 a)    新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；
 b)    返回字符串从第6个字符到第20个字符的子串；
 c)    删除其中所有的OS字符；
 */
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS"
let index6 = str.index(str.startIndex, offsetBy: 6)
let index20 = str.index(str.startIndex, offsetBy: 20)
var str1:String = String(str[index6..<index20])
print(str1)
var str2 = str.replacingOccurrences(of: "OS", with: "")
print(str2)
/*
 1.    将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
 */
var dict = ["BeijingTime":beijing,"TokyoTime":tokyo,"LondonTime":london,"NewYork":newYork,"str":str,"str1":str1,"str2":str2] as AnyObject
let fileManager = FileManager.default
if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    docPath.appendPathComponent("dict.txt")
    dict.write(toFile: docPath.path, atomically: true)
    let data = NSDictionary(contentsOf: docPath)
    print(data as Any)
}

/*
 1.    从网上下载一张照片并保存到本地沙盒的Document的某文件中；

 */
let imageUrl = URL(string: "http://pic5.photophoto.cn/20071228/0034034901778224_b.jpg")!
let imageData = try? Data(contentsOf: imageUrl)
var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
url.appendPathComponent("mypic.jpg")
print(url.path)
try? imageData?.write(to: url)
let image = UIImage(data: imageData!)
/*
 1.    从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析；
 */
enum MyError:Error {
    case Zero
    case NotURL
}
let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")
let jasondata = try! Data(contentsOf: weatherUrl!)
let json = try! JSONSerialization.jsonObject(with: jasondata, options: .allowFragments)
guard let dic = json as? [String:Any]  else{
   throw MyError.NotURL
}
guard let weather = dic["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
let temp1 = weather["temp1"]
let temp2 = weather["temp2"]
print(temp1!)
print(temp2!)
