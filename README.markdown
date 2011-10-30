Core JS
================================================================================

An implementation of some useful parts from the C standard library, and a few
useful parts inspired by the C standard library, and some parts that are
implemented because some parts of Javascript are brain dead, like integer
support.

More to be added, soon(tm)!


Allocating Buffers
--------------------------------------------------------------------------------

### CSAlloc ###

    CSAlloc(n)

Returns a buffer of length `n`, just like `malloc`, but it sets every byte of
the allocated buffer to 0 as when using `calloc`.


### CSRealloc ###

    CSRealloc(source, n)

Like `realloc`, but it does not free `source`, the only way to free something in
core.js is via garbage collection.


### CSByteBuffer ###

    CSByteBuffer(bytes...)

Allocates a buffer containing `bytes`.


### CSRead ###

    CSRead(src, offset, n)

Creates a new buffer, with the same values as `src` from `offset` and `n` bytes
on.


### CSRead(Native|Little|Big)(16|32|64) ###

    CSReadBig16(src, offset)

Reads a 2, 4 or 8 byte unit from a buffer into a newly allocated buffer, this
seems like it is a pretty useless endeavour, but Javascript doesn't support
integers very well, especially not unsigned ones.


### CSLoad(U?)Int8 ###

    CSLoadInt8(src, offset)

Loads a single byte integer from a buffer into a Javascript number.


### CSLoad(Native|Little|Big)(U?)Int(16|32) ###

    CSLoadBigInt16(src, offset)

Loads a 2 or 4 byte integer from a buffer into a Javascript number, 8 byte integers are not supported since they would lose precision.


### CSStringToBuffer ###

    CSStringToBuffer(string)

Creates a new buffer, with the same values as the ASCII values of each character
in `string`. You probably should only call this on constant strings, users will
probably not be aware of the ASCII limitations.


Comparison
--------------------------------------------------------------------------------

### CSCompare ###

    CSCompare(a, aOffset, b, bOffset, n)

Like `memcmp`, but returns true if equal


### CSCompareToString ###

    CSCompareToString(a, aOffset, b, bOffset, n)

The same as `CSCompare`, but `b` is a string instead of a buffer. See the
limitations of CSStringToBuffer.


Copy
--------------------------------------------------------------------------------

### CSCopy ###

    CSCopy(dst, offset, src, offset, n)

Very similar to `memcpy`, but since we do not have pointers, the interface is
a little different.


### CSCopyFromString ###

    CSCopyFromString(dst, dstOffset, src, srcOffset, n)

The same as `CSCopy`, but the source is a string instead of a buffer. See the
limitations of CSStringToBuffer.


Endian Conversion
--------------------------------------------------------------------------------

### CSBigEndian ###

    CSBigEndian

A property containing `true` if the system is big endian, but most likely it
will contain `false`, since few systems these days are big endian. This fact
makes me sad, since big endian makes much more sense.


### CSSwap16/32/64 ###

    CSSwap16(dst, offset, src, offset, n)

Copies from `src` to `dst`, but swaps the order of each 2, 4 or 8-byte unit. `n`
must be a multiple of 2, 4 or 8 respectively.


### CS(Big|Little)ToNative(16|32|64) ###

    CSBigToNative16(dst, offset, src, offset, n)

Copies from `src` to `dst`, but changes the order of each 2, 4 or 8-byte unit
from big/little endian to native endian. `n` must be a multiple of 2, 4 or 8
respectively.

It is safe for `src` and `dst` to be the same buffer.


### CSNativeTo(Big|Little)(16|32|64) ###

    CSNativeToBig16(dst, offset, src, offset, n)

Copies from `src` to `dst`, but changes the order of each 2, 4 or 8-byte unit
from native endian to big/little endian. `n` must be a multiple of 2, 4 or 8
respectively.

It is safe for `src` and `dst` to be the same buffer.


Bitwise
-------------------------------------------------------------------------------

### CSBitwiseNOT ###

    CSBitwiseNOT(dst, offset, a, offset, n)

Applies a bitwise operator to `a`, assigning the result to `dst`. Only operates
on the `n` first bytes.


### CSBitwise(AND|NAND|NOR|OR|XOR) ###

    CSBitwiseAND(dst, offset, a, offset, b, offset, n)

Applies a bitwise operator to `a` and `b`, assigning the result to `dst`. Only
operates on the `n` first bytes.


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
