-- Exobromine for TIC-80
-- A 256 byte demo by Going Digital, for release at Lovebyte 2023
-- DO NOT RELEASE
--
-- 234 bytes, 22 bytes remaining
--
-- Compress with pakettic -z3 -alahc
--
--{
function BDR(...)
  --{
  -- Background gradient
  poke(16322, ...*...)
  -- Hide mouse cursor
  poke(16379, 1)
  --}
end

function TIC()
  -- Audio
  -- Set volume to 15 (full) and pitch to 0x100
  poke(65437,241)
  -- Bytebeat based on time().
  -- time() is not synchronised to TIC-80 frames, which gives a pseudo-random
  -- kick drum beat.
  -- The multiplying by v gives the rising/falling tone.
  v=time()<<4
  for i=0,31 do
    poke4(130876+i, v >> 7 | (v >> 7) * v >> 5)
    v=v+1
  end

  -- Video
  if (time()>>13)%2<1 then cls() end

  -- Rotating tetrix
  -- https://mathworld.wolfram.com/Tetrix.html
  -- 
  for x=-31,31 do
    for y=-31,31 do
      -- Tetrix mapping in z axis
      -- Tetrix is a 3D analogue of a Sierpinski triangle, as a tetrahedron.
      -- https://mathworld.wolfram.com/Tetrix.html
      -- For a power of 2 dimension, each x/y position has 1 corresponding z
      -- position, which is z=x xor y. That makes it great for sizecoding!
      z=x~y
      -- Rotation about x/y
      x1=x*cos1+y*sin1
      y1=y*cos1-x*sin1
      -- Rotate about y1/z
      x2=x1*cos2+z*sin2
      z2=z*cos2-x1*sin2
      scale=90/(90+z2)
      -- Plot points
      pix(120+x2*(2+sin2)*scale,68+y1*(2+sin2)*scale,3+pix(120+x2,68+y1))
    end
  end
  --{
  -- These are digital oscillators, in modified coupled form.
  -- https://ccrma.stanford.edu/~jos/pasp/Digital_Sinusoid_Generators.html
  -- Doing it this way saves having to involk math.sin/cos and its faster too.
  sin1=sin1+cos1/99
  cos1=cos1-sin1/99
  sin2=sin2+cos2/89
  cos2=cos2-sin2/89
  --}
end
sin1=0 cos1=1
sin2=0 cos2=1
--}

-- Scroller, excluded from 256 byte entry
--t=0OVR=load't=t+.5txt={"Exobromine","by GoingDigital 2023","","Made with love in Lowestoft, UK","for Lovebyte 2023","","My first attempt at a scene.","Voxel metaballs, colour graduation,","perspective and xor textures in 256 bytes.","","Packed by pakettic.","","Thanks to","aldroid blackle dave84 djh0ffman","evvvvil ferris flopine gasman","HellMood iq mantatronic pestis","psenough superogue ToBach","for support, encouragement,","tools, articles and streams"}z=t//2%400-150 for i=1,#txt do w=print(txt[i],0,-9)print(txt[i],120-w//2+1,i*10-z+1,10)print(txt[i],120-w//2,i*10-z,12)end'

-- TIC-80 default ancilliary data
-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>
