module org.k33g.rainbow

struct terminal = {escCode}

#http://www.termsys.demon.co.uk/vtansi.htm
#http://rsiqueira.postbit.com/upload/2/posts/unicode.html
#http://www.unicode.org/charts/PDF/U2500.pdf
#http://www.unicode.org/charts/PDF/U2580.pdf
#http://www.unicode.org/charts/
#http://dmmarks.com/UnicodeChars.html

augment org.k33g.rainbow.types.terminal {

  function reset = |this| -> this:print(this:escCode()+"0m")

  # make reset before ?
  function bright = |this| -> this:print(this:escCode()+"1m")

  function dim = |this| -> this:print(this:escCode()+"2m")

  function underscore = |this|  -> this:print(this:escCode()+"4m")

  function blink = |this| -> this:print(this:escCode()+"5m")

  function reverse = |this|  -> this:print(this:escCode()+"7m")

  function hidden = |this| -> this:print(this:escCode()+"8m")

  function black = |this| -> this:print(this:escCode()+"30m")

  function blackBg = |this| -> this:print(this:escCode()+"40m")

  function gray = |this| -> this:print(this:escCode()+"30;1m")

  function red = |this| -> this:print(this:escCode()+"31m")

  function brightRed = |this| -> this:print(this:escCode()+"31;1m")

  function redBg = |this| -> this:print(this:escCode()+"41m")

  function green = |this| -> this:print(this:escCode()+"32m")

  function brightGreen = |this| -> this:print(this:escCode()+"32;1m")

  function greenBg = |this| -> this:print(this:escCode()+"42m")

  function yellow = |this| -> this:print(this:escCode()+"33m")

  function brightYellow = |this| -> this:print(this:escCode()+"33;1m")

  function yellowBg = |this| -> this:print(this:escCode()+"43m")

  function blue = |this| -> this:print(this:escCode()+"34m")

  function brightBlue = |this| -> this:print(this:escCode()+"34;1m")

  function blueBg = |this| -> this:print(this:escCode()+"44m")

  function purple = |this| -> this:print(this:escCode()+"35m") # Magenta

  function brightPurple = |this| -> this:print(this:escCode()+"35;1m")

  function purpleBg = |this| -> this:print(this:escCode()+"45m")

  function cyan = |this| -> this:print(this:escCode()+"36m")

  function brightCyan = |this| -> this:print(this:escCode()+"36;1m")

  function cyanBg = |this| -> this:print(this:escCode()+"46m")

  function white = |this| -> this:print(this:escCode()+"37m")

  function brightWhite = |this| -> this:print(this:escCode()+"37;1m")

  function whiteBg = |this| -> this:print(this:escCode()+"47m")

  function pos = |this, row, col| ->
    this:print(this:escCode()+"%s;%sf":format(row:toString(), col:toString())) 

  #function pos = |this, row, col| {
  #  this:row(row)
  #  this:col(col)
  #  this:code(this:escCode()+"%s;%sf":format(row:toString(), col:toString())) 
  #  return this
  #}

  function home = |this| -> this:pos(0,0)

  # Cursor Forward    <ESC>[{COUNT}C
  # Moves the cursor forward by COUNT columns; the default count is 1.
  function forward = |this, howMany| ->
    this:print(this:escCode()+"%sC":format(howMany:toString())) 

  #function forward = |this, howMany| {
  #  this:col(this:col() + howMany)
  #  this:code(this:escCode()+"%sC":format(howMany:toString())) 
  #  return this
  #}

  function forward = |this| -> this:forward(1)

  # Cursor Backward   <ESC>[{COUNT}D
  # Moves the cursor backward by COUNT columns; the default count is 1.
  function backward = |this, howMany| ->
    this:print(this:escCode()+"%sD":format(howMany:toString())) 

  #function backward = |this, howMany| {
  #  this:col(this:col() - howMany)
  #  this:code(this:escCode()+"%sD":format(howMany:toString())) 
  #  return this
  #}

  function backward = |this| -> this:backward(1)

  # Cursor Up   <ESC>[{COUNT}A
  # Moves the cursor up by COUNT rows; the default count is 1.
  function up = |this, howMany| ->
    this:print(this:escCode()+"%sA":format(howMany:toString())) 

  #function up = |this, howMany| {
  #  this:row(this:row() - howMany)
  #  this:code(this:escCode()+"%sA":format(howMany:toString())) 
  #  return this
  #}

  function up = |this| -> this:up(1)

 # Cursor Down   <ESC>[{COUNT}B
 # Moves the cursor down by COUNT rows; the default count is 1.
  function down = |this, howMany| ->
    this:print(this:escCode()+"%sB":format(howMany:toString())) 

  #function down = |this, howMany| {
  #  this:row(this:row() + howMany)
  #  this:code(this:escCode()+"%sB":format(howMany:toString())) 
  #  return this
  #}

  function down = |this|  -> this:down(1)
  
  function clear = |this| -> this:print(this:escCode()+"2J")

  function drawLineForward = |this, char, howMany| -> this:print(char * howMany) 

  #function drawLineForward = |this, char, howMany| {
  #  howMany:times({
  #    this:print(char) 
  #  })
  #  return this
  #}

  function drawLineBackward = |this, char, howMany| {
    howMany:times({
      this:print(char):backward():backward()
    })
    return this
  }  

  function drawLineDown = |this, char, howMany| {
    howMany:times({
      this:print(char):down():backward()
    }) 
    return this
  }

  function drawLineUp = |this, char, howMany| {
    howMany:times({
      this:print(char):up():backward()
    }) 
    return this
  }

  function simpleBox = |this, width, height| ->
    this:print("\u250c")
      :drawLineForward("\u2500", width)
      :print("\u2510")
      :down():backward():drawLineDown("\u2502", height)
      :print("\u2518")
      :backward():backward():drawLineBackward("\u2500", width)
      :print("\u2514")
      :backward():up():drawLineUp("\u2502", height)

  function doubleBox = |this, width, height| ->
    this:print("\u2554")
      :drawLineForward("\u2550", width)
      :print("\u2557")
      :down():backward():drawLineDown("\u2551", height)
      :print("\u255D")
      :backward():backward():drawLineBackward("\u2550", width)
      :print("\u255A")
      :backward():up():drawLineUp("\u2551", height)

  # don't change cursor position
  function eraseLine = |this| -> this:print(this:escCode()+"2K")

  # don't change cursor position
  function eraseScreen = |this| -> this:print(this:escCode()+"2J"):home()

  function print = |this, message| {
    print(message)
    return this
  }
  function println = |this, message| {
    println(message)
    return this
  }

}

function console = {
  let term = terminal("\u001B[")
  term:home()
  return term
} 

function clear = -> console():clear()

# for test with library
function error = |line, col, message| {
  console():red():pos(line, col):eraseLine():print(message)
}

function information = |line, col, message| {
  console():blue():pos(line, col):eraseLine():print(message) 
}

function success = |line, col, message| {
  console():green():pos(line, col):eraseLine():print(message) 
}



