(function() {
  window.alloc = function(n) {
    return new ArrayBuffer(n);
  };
  window.memcpy = function(dst, src, n) {
    var i;
    for (i = 0; 0 <= n ? i < n : i > n; 0 <= n ? i++ : i--) {
      dst[i] = src[i];
    }
    return dst;
  };
  window.memcpy2 = function(dst, dstOffset, src, srcOffset, n) {
    var a, b, i, _ref;
    _ref = [dstOffset, srcOffset], a = _ref[0], b = _ref[1];
    for (i = 0; 0 <= n ? i < n : i > n; 0 <= n ? i++ : i--) {
      dst[a] = src[b];
      a += 1;
      b += 1;
    }
    return dst;
  };
  window.memcpy3 = function(dst, dstOffset, dstStride, src, srcOffset, srcStride, n) {
    var a, b, i, _ref;
    _ref = [dstOffset, srcOffset], a = _ref[0], b = _ref[1];
    for (i = 0; 0 <= n ? i < n : i > n; 0 <= n ? i++ : i--) {
      dst[a] = src[b];
      a += dstStride;
      b += srcStride;
    }
    return dst;
  };
  ArrayBuffer.prototype.realloc = function(n) {
    return memcpy(new ArrayBuffer(n), this);
  };
}).call(this);
