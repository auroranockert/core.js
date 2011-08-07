Core JS
================================================================================

An implementation of some useful parts from the C standard library, and a few
useful parts inspired by the C standard library, right now the following
functions are implemented.

  * CSAlloc(n) - like malloc, but always initializes with 0
  * CSCopy(dst, dstOffset, src, srcOffset, n) - like memcpy, but takes offsets
  * CSRealloc(source, newSize) - like realloc, but doesn't free the source
  * CSCompare(a, aOffset, b, bOffset, n) - like memcmp, returns true if equal
  * CSStringToBuffer(string) - converts a bytestring to a buffer
  * CSCopyFromString(dst, dstOffset, src, srcOffset, n) - copies from a string

And some parts that are not

  * CSBigEndian - is the current system big endian?
  * CSByteSwap16(n) - Swap a 16-bit number
  * CSByteSwap32(n) - Swap a 32-bit number
  * CSBig16ToNative(n) - Convert a 16-bit number from big to native endian
  * CSBig32ToNative(n) - Convert a 32-bit number from big to native endian
  * CSLittle16ToNative(n) - Convert a 16-bit number from little to native endian
  * CSLittle32ToNative(n) - Convert a 32-bit number from little to native endian

More to be added, soon(tm)!


License (MIT)
-------------------------------------------------------------------------------

Copyright (C) 2011 by Jens Nockert

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
