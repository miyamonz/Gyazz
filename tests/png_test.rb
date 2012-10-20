# -*- coding: utf-8 -*-
require 'test/unit'

$: << 'lib'
require 'png'

class PngTest < Test::Unit::TestCase
  TMPFILE = "/tmp/pngtest#{$$}.png"
  
  def setup
  end
  
  def teardown
    File.delete TMPFILE
  end

  def test_1
    data = [
            [[255,0,0], [0,255,0]],
            [[0,0,255], [0,0,0]]
           ]
    png = PNG.png(data)
    File.open(TMPFILE,"w"){ |f|
      f.print png
    }
    file = `file #{TMPFILE}`
    assert file.index("PNG image, 2 x 2, 8-bit/color RGB, non-interlaced")
  end

  def test_2
    data = [
            [[255,0,0], [0,255,0]],
            [[0,0,255], [0,0,0]],
            [[0,0,255], [0,0,0]]
           ]
    png = PNG.png(data)
    File.open(TMPFILE,"w"){ |f|
      f.print png
    }
    file = `file #{TMPFILE}`
    assert !file.index("PNG image, 2 x 2, 8-bit/color RGB, non-interlaced")
  end
end

