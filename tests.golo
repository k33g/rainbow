module tests

import rainbow

function main = |args| {

  
  console():clear():pos(0,5)
   :red():print("Golo"):brightRed():println("Golo")
   :pos(10,5):blue():println("Rainbow by @k33g_org")
   :pos(5,5):green():print("\u27fb "):blackBg()
  readln("Hello, do you know Golo ?")
  
  console():reset():cyan():pos(15,10):drawLine("=",15)
  readln("> ?")

  console():red():reverse():pos(20,8):println("Hello")
  console():reset():red():pos(21,10):bright():underscore():println("World!")

  println("")
  println("")
  #console():clear():pos(0,5)

}

