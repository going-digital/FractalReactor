-- Exobromine for TIC-80
-- A 256 byte demo by Going Digital, for release at Lovebyte 2023
-- DO NOT RELEASE
--
-- Compress with pakettic -z5 -alahc
--
--{
s=math.sin
function BDR(...)
  -- Background gradient
  poke(16320,...)
end
function TIC()
  -- Audio
  poke(65437,
    -15 --| 241
  )
  v=time()<<4
  for i=0,31 do
    poke4(130876+i, v >> 7 | (v >> 7) * v >> 5)
    v=v+1
  end
  
  cls()
    
  -- Voxel metaballs
  for z = -7, 7 do
    for y = -7, 7 do
      for x = -7, 7 do
        -- Metaballs, using lots of deliberately repetitive code to make more compressible.
        i=7
        u1=z+4*s(t/i) i=i+2
        v1=z+4*s(t/i) i=i+2
        --w1=z+4*s(t/i) i=i+2
        u2=y+4*s(t/i) i=i+2
        --v2=y+4*s(t/i) i=i+2
        w2=y+4*s(t/i) i=i+2
        --u3=x+4*s(t/i) i=i+2
        v3=x+4*s(t/i) i=i+2
        w3=x+4*s(t/i)
        if 1/(v1^2+y^2+v3^2)+1/(z^2+w2^2+w3^2)+1/(u1^2+u2^2+x^2)>.1 then
          -- Draw a voxel ball
          --{
          a=4*(30+x-y)
          b=(2*(x-2*z+y)+t)%239
          --}
          circ(a,b,4,2)
          circb(a,b,4,1)
          circ(a,b+2,2,3)
        end
      end
    end
  end
  t = t + 1
end
t = 0
--}

-- Scroller, excluded from 256 byte entry
-- OVR=load'txt={"Exobromine","by GoingDigital 2023","","Made with love in Lowestoft, UK","for Lovebyte 2023","","My first attempt at a scene.","Voxel metaballs, colour graduation,","perspective and xor textures in 256 bytes.","","Packed by pakettic.","","Thanks to","aldroid blackle dave84 djh0ffman","evvvvil ferris flopine gasman","HellMood iq mantatronic pestis","psenough superogue ToBach","for support, encouragement,","tools, articles and streams"}z=t//2%400-150 for i=1,#txt do w=print(txt[i],0,-9)print(txt[i],120-w//2+1,i*10-z+1,10)print(txt[i],120-w//2,i*10-z,12)end'

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
