object "A" {
  code {
    datacopy(0, dataoffset("Runtime"), datasize("Runtime"))
    return(0, datasize("Runtime"))
  }
  object "Runtime" {
    // Return the calldata
    code {
      mstore(0x80, 66)
      return(0x80, 0x20)
    }
  }
}
