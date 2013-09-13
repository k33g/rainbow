module rainbow

struct terminal = {escCode}

#http://www.termsys.demon.co.uk/vtansi.htm
#http://rsiqueira.postbit.com/upload/2/posts/unicode.html
#http://www.unicode.org/charts/PDF/U2500.pdf
#http://www.unicode.org/charts/PDF/U2580.pdf
#http://www.unicode.org/charts/

augment rainbow.types.terminal {

  function reset = |this| {
    print(this:escCode()+"0m")
    return this
  }

  function black = |this| {
    print(this:escCode()+"30m")
    return this
  }

  function gray = |this| {
    print(this:escCode()+"30;1m")
    return this
  }

  function red = |this| {
    print(this:escCode()+"31m")
    return this
  }

  function brightRed = |this| {
    print(this:escCode()+"31;1m")
    return this
  }

  function green = |this| {
    print(this:escCode()+"32m")
    return this
  }

  function brightGreen = |this| {
    print(this:escCode()+"32;1m")
    return this
  }

  function yellow = |this| {
    print(this:escCode()+"33m")
    return this
  }

  function yellowBg = |this| {
    print(this:escCode()+"43m")
    return this
  }  

  function brightYellow = |this| {
    print(this:escCode()+"33;1m")
    return this
  }

  function blue = |this| {
    print(this:escCode()+"34m")
    return this
  }

  function brightBlue = |this| {
    print(this:escCode()+"34;1m")
    return this
  }

  function purple = |this| {
    print(this:escCode()+"35m")
    return this
  }

  function brightPurple = |this| {
    print(this:escCode()+"35;1m")
    return this
  }

  function cyan = |this| {
    print(this:escCode()+"36m")
    return this
  }

  function brightCyan = |this| {
    print(this:escCode()+"36;1m")
    return this
  }

  function white = |this| {
    print(this:escCode()+"37m")
    return this
  }

  function brightWhite = |this| {
    print(this:escCode()+"37;1m")
    return this
  }


  function pos = |this, row, col| {
    print(this:escCode()+"%s;%sf":format(row:toString(), col:toString())) 
    return this
  }

  function clear = |this| {
    print(this:escCode()+"2J")
    return this   
  }

  function print = |this, message| {
    print(message)
    return this
  }

  function println = |this, message| {
    println(message)
    return this
  }
}

function console = -> terminal("\u001B[")
