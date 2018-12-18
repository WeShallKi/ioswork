//: Playground - noun: a place where people can play

import UIKit

/*（1）给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组;*/
var dict:[[String:Any]] = [["name":"lgy","age":43],["name":"xiaoqi","age":18],
    ["name":"cx","age":23]]
var str = dict.map{$0["age"]!}
print(str)
/*
 （2）    给定一个String数组，用filter函数选出能被转成Int的字符串
 */
var second:[String] = ["123","1","2","sd","lgy","xiaqi"]
var arrSecond = second.filter(){Int($0) != nil }
print(arrSecond)
/*
 （3）用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
 */
var arrThird = second.reduce(""){$0+$1+","}
arrThird.removeLast()
print(arrThird)
/*
 （4）用 reduce 方法一次求出整数数组的最大值、最小值、总数和
 */
var number = [2,5,1,3,4,7,9,8,10]
var numbers = number.reduce((max:number[0],min:number[0],sum:0)){(max($0.max,$1),min($0.min,$1),$0.sum+$1)}
print(numbers)
/*
 （5）新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
 */
func returnNum() -> Int
{
    return 1
}
func returnAndUseNum1(a:Int) -> Int
{
    return a
}
func returnString() -> String
{
    return "hello world"
}
func returnAndUseNum2(b:Int) -> Int
{
    return b+5
}
var arr5:[Any] = [returnNum,returnString,returnAndUseNum1,returnAndUseNum2]
for (key,value) in arr5.enumerated()
{
    if value is (Int) -> Int
    {
        print("下标：\(key),满足参数为一个整数，返回值为一个整数")
    }
}
/*
 （6）扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
 */
extension Int{
    func Sqrt() -> Double
    {
        return sqrt(Double(self))
    }
}
var a:Int = 10
print(a.Sqrt())
/*
 （7）实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
 */
func Compare<T:Comparable>(a:T...) -> (T,T)
{
    return a.reduce((max:a[0],min:a[0])){(max($0.max,$1),min($0.min,$1))}
}
print(Compare(a: "1","2","sdsd","lgy","wxq","544"))
print(Compare(a: 1,2,3,4,5,6,2,1,5,3,11,2,3,34))
print(Compare(a: 1,2.0,3.5,4,6.7,0.3))
/*
 （8）实现Person类：
 a)    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
 b)    具有指定构造函数和便利构造函数；
 c)    两个Person实例对象可以用==和!=进行比较；
 d)    Person实例可以直接用print输出；
 e)    Person增加run方法(方法里面直接print输出Person XXX is running;
 */
enum Department:Int{
    case math,chinese,english,biology
}
enum Gender:Int{
    case male,female
    static func <(genderx:Gender,gendery:Gender) -> Bool
    {
        return genderx.rawValue < gendery.rawValue
    }
}
class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName + " " + lastName
        }
    }
    var description: String{
        return "name:\(fullName),age:\(age),gender:\(gender)"
    }
    func run() -> Void
    {
        print("Person \(fullName) is running")
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.age = age
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
    }
    convenience init(gender:Gender){
        self.init(firstName:" ",lastName:" ",age:18,gender:Gender.female)
        self.gender = gender
    }
    static func ==(p1:Person,p2:Person) -> Bool{
        return p1.fullName==p2.fullName && p1.age==p2.age && p1.gender==p2.gender
    }
    static func !=(p1:Person,p2:Person) -> Bool{
        return p1.fullName != p2.fullName || p1.age != p2.age || p1.gender != p2.gender
    }
    
}
/*
 （9）从Person分别派生Teacher类和Student类：
 a)    Teacher类增加属性title，实例可以直接用print输出；
 b)    Student类增加属性stuNo，实例可以直接用print输出；
 c)    Teacher和Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)

 */
protocol SchoolProtocol{
    var department:Department{
        get
    }
    func lendBook() -> Void
}

class Teacher:Person , SchoolProtocol{
    var title:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    var department: Department{
        return .chinese
    }
    override var description: String{
        return super.description + ",title:\(title)"
    }
    override func run() -> Void{
        print("Teacher \(fullName) is running")
    }
    func lendBook() {
        print("Teacher \(fullName) lend a book")
    }
}
class Student:Person, SchoolProtocol{
    var stuNo:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    var department: Department{
        return .english
    }
    override var description: String{
        return super.description + ",stuNo:\(stuNo)"
    }
    override func run(){
        print("Student \(fullName) is running")
    }
    func lendBook() {
        print("Teacher \(fullName) lend a book")
    }
}
/*
 （10）分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
 */
var p1 = Person(firstName: "lgy", lastName: "l", age: 18, gender: Gender.male)
var p2 =  Teacher(firstName: "l", lastName: "gy", age: 18, gender: Gender.male, title: "professor")
var p3 = Student(firstName: "w", lastName: "xq", age: 12, gender: Gender.male, stuNo: "2016100738")
print(p1)
print(p2)
print(p3)
var p4 = Teacher(firstName: "su", lastName: "han", age: 23, gender: Gender.female, title: "professor")
var p5 = Student(firstName: "chen", lastName: "xi", age: 21, gender: Gender.male, stuNo: "2016110503")
var p6 = Teacher(firstName: "liao", lastName: "xuehua", age: 25, gender: Gender.female, title: "teacher")
var p7 = Person(firstName: "wang", lastName: "haonan", age: 19, gender: Gender.male)
var people = [p1,p2,p3,p4,p5,p6,p7]
/*
 （11）新建一个协议SchoolProtocol，协议包括一个department属性(Enum，自己实现enum的定义)和lendBook方法（随便写点内容，能区隔即可）；
 */
//已在前面修改
/*
 （12）修改Teacher和Student，让这两个类实现该协议；

 */
//已在前面修改
/*
 （13）对数组执行以下要求：
 a)    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
 b)    对数组按以下要求排序并输出：age、fullName、gender+age；
 c)    对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法；

 */
var personDict:[String:Int] = ["Person":0,"Teacher":0,"Student":0]
for value in people{
    if value is Teacher{
        personDict["Teacher"]! += 1
    }else if value is Student{
        personDict["Student"]! += 1
    }else{
        personDict["Person"]! += 1
    }
}
print(personDict)
people.sort(){$0.age<$1.age}
print(people)
people.sort(){$0.fullName < $1.fullName}
print(people)
people.sort(){$0.gender.rawValue+$0.age < $1.gender.rawValue+$1.age}
print(people)
for i in people{
    i.run()
    if let a = i as? Student{
        a.lendBook()
    }else if let a = i as? Teacher{
        a.lendBook()
    }else{
        print("\(i.fullName) is not Teacher or Student")
    }
}
