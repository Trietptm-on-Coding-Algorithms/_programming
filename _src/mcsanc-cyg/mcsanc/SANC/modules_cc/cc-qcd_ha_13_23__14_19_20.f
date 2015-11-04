************************************************************************
* sanc_cc_v1.40 package.
************************************************************************
* File (cc-qcd_ha_13_23__14_19_20.f) is created on Tue Aug  9 23:04:54 MSD 2011.
************************************************************************
* This is the FORTRAN module (cc_qcd_ha_13_23__14_19_20) to calculate
* differential cross-section of the gluon induced
* anti-up + g -> anti-dn + tn + ta^- process.
*
* It is produced by s2n package of SANC (v1.10) Project.
* Copyright (C), SANC Project Team, 2002-2011.
*
* http://sanc.jinr.ru/
* http://pcphsanc.cern.ch/
* E-mail: <sanc@jinr.ru>
************************************************************************
      subroutine cc_qcd_ha_13_23__14_19_20 (s,spr,ph4,costh4,costh5,hard)
      implicit none!
      include 's2n_declare.h'

      real*8 sq,sqspr
      real*8 p1p2,p1p3,p1p4,p1p5,p2p3,p2p4,p2p5,p3p4,p3p5,p4p5
      real*8 ph4,cosph4,sinph4,costh4,sinth4,costh5,sinth5
      real*8 sqrtlsdnspr,isqrtlsdnspr
      real*8 kappaw
      complex*16 chiwspr,chiwsprc
      real*8 iz1up,iz2dn

      cmw2 = mw2

      sq = dsqrt(s)
      sqspr = dsqrt(spr)

      cosph4 = dcos(ph4)
      sinph4 = dsin(ph4)
      sinth4 = dsqrt(1d0-costh4**2)
      sinth5 = dsqrt(1d0-costh5**2)

      sqrtlsdnspr = sqrt(s**2-2d0*s*(rdnm2+spr)+(rdnm2-spr)**2)
      isqrtlsdnspr = 1d0/sqrtlsdnspr
      
      kappaw = gf*rwm2/(sqrt(2d0)*4d0*pi)/alpha
      if (irun.eq.0) then
         chiwspr = 4d0*kappaw*spr/(spr-cmw2)
      else
         chiwspr = 4d0*kappaw*spr/(spr-dcmplx(mw**2,-spr*ww/mw))
      endif
      chiwsprc = dconjg(chiwspr)


      p1p2=
     & +costh5*(-1d0/4*(s-spr))
     & +1d0/4*spr-1d0/4*s

      p1p3=
     & +sinph4*sinth4*sinth5*(1d0/4*sq*sqspr-1d0/4*sq*sqspr*mta**2/spr)
     & +costh4*costh5*(1d0/8*spr+1d0/8*s-1d0/8*mta**2-1d0/8*mta**2*s/spr
     & )
     & +costh4*(-1d0/8*(s-spr)
     & +1d0/8*mta**2/spr*(s-spr))
     & +costh5*(1d0/8*(s-spr)
     & +1d0/8*mta**2/spr*(s-spr))
     & -1d0/8*spr-1d0/8*s-1d0/8*mta**2-1d0/8*mta**2*s/spr

      p1p4=
     & +sinph4*sinth4*sinth5*(-1d0/4*sq*sqspr+1d0/4*sq*sqspr*mta**2/spr)
     & +costh4*costh5*(-1d0/8*spr-1d0/8*s+1d0/8*mta**2+1d0/8*mta**2*s/sp
     & r)
     & +costh4*(1d0/8*(s-spr)
     & -1d0/8*mta**2/spr*(s-spr))+costh5*(1d0/8*(s-spr)
     & -1d0/8*mta**2/spr*(s-spr))-1d0/8*spr-1d0/8*s+1d0/8*mta**2+1d0/8*m
     & ta**2*s/spr

      p1p5=
     & -1d0/2*s

      p2p3=
     & +costh4*(-1d0/4*(s-spr)
     & +1d0/4*mta**2/spr*(s-spr))
     & -1d0/8*(s-spr)+1d0/8*spr-1d0/8*s+1d0/8*mta**2/s*(s-spr)
     & +1d0/8*mta**2/s*spr-1d0/8*mta**2/spr*(s-spr)
     & -1d0/8*mta**2*s/spr

      p2p4=
     & +costh4*(1d0/4*(s-spr)
     & -1d0/4*mta**2/spr*(s-spr))-1d0/8*(s-spr)+1d0/8*spr-1d0/8*s-1d0/8*
     & mta**2/s*(s-spr)
     & -1d0/8*mta**2/s*spr+1d0/8*mta**2/spr*(s-spr)
     & +1d0/8*mta**2*s/spr

      p2p5=
     & +costh5*(1d0/4*(s-spr))
     & +1d0/4*spr-1d0/4*s

      p3p4=
     & -1d0/2*spr+1d0/2*mta**2

      p3p5=
     & +sinph4*sinth4*sinth5*(-1d0/4*sq*sqspr+1d0/4*sq*sqspr*mta**2/spr)
     & +costh4*costh5*(-1d0/8*spr-1d0/8*s+1d0/8*mta**2+1d0/8*mta**2*s/sp
     & r)
     & +costh4*(-1d0/8*(s-spr)
     & +1d0/8*mta**2/spr*(s-spr))
     & +costh5*(-1d0/8*(s-spr)
     & -1d0/8*mta**2/spr*(s-spr))-1d0/8*spr-1d0/8*s-1d0/8*mta**2-1d0/8*m
     & ta**2*s/spr

      p4p5=
     & +sinph4*sinth4*sinth5*(1d0/4*sq*sqspr-1d0/4*sq*sqspr*mta**2/spr)
     & +costh4*costh5*(1d0/8*spr+1d0/8*s-1d0/8*mta**2-1d0/8*mta**2*s/spr
     & )
     & +costh4*(1d0/8*(s-spr)
     & -1d0/8*mta**2/spr*(s-spr))+costh5*(-1d0/8*(s-spr)
     & +1d0/8*mta**2/spr*(s-spr))
     & -1d0/8*spr-1d0/8*s+1d0/8*mta**2+1d0/8*mta**2*s/spr

      iz1up=
     & +1d0/(1-mup**2/s)*(1d0/s)

      iz2dn=
     & +1d0/(1-mup**2/s)*1d0/(mdn**2/s+1d0/4*sqrtlsdnspr**2*sinth5**2/s*
     & *2)*(-1d0/2/s**2*spr+1d0/2/s+1d0/2*mdn**2/s**2+1d0/2*sqrtlsdnspr*
     & costh5/s**2)

      hard=
     & +iz2dn**2*chiwspr*chiwsprc/pi*alpha**2*alphas/spr**3*(s-spr)*cf*(
     & 1d0/16*p1p3*p2p4*mdn**2*mta**2/s**2-1d0/16*p1p3*p4p5*mdn**2*mta**
     & 2/s**2)
     & +iz2dn**2*chiwspr*chiwsprc/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(
     & -1d0/16*p1p3*p2p4*mdn**2/s**2+1d0/16*p1p3*p4p5*mdn**2/s**2)
     & +iz2dn*chiwspr*chiwsprc/pi*alpha**2*alphas/spr**3*(s-spr)*cf*(1d0
     & /8*p1p2*p1p3*p2p4*mta**2/s**3-1d0/16*p1p2*p1p3*p4p5*mta**2/s**3+1
     & d0/16*p1p2*p2p4*p3p5*mta**2/s**3+1d0/32*p1p3*p2p4*mta**2/s**2-1d0
     & /32*p1p3*p4p5*mta**2/s**2+1d0/32*p2p3*p2p4*mta**2/s**2)
     & +iz2dn*chiwspr*chiwsprc/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(-1d
     & 0/8*p1p2*p1p3*p2p4/s**3+1d0/16*p1p2*p1p3*p4p5/s**3-1d0/16*p1p2*p2
     & p4*p3p5/s**3-1d0/32*p1p3*p2p4/s**2+1d0/32*p1p3*p4p5/s**2-1d0/32*p
     & 2p3*p2p4/s**2)
     & +chiwspr*chiwsprc/pi*alpha**2*alphas/spr**3*(s-spr)*cf*(-1d0/32*p
     & 1p3*p1p4*mta**2/s**3-1d0/32*p1p3*p2p4*mta**2/s**3-1d0/32*p2p4*p3p
     & 5*mta**2/s**3)
     & +chiwspr*chiwsprc/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(1d0/32*p1
     & p3*p1p4/s**3+1d0/32*p1p3*p2p4/s**3+1d0/32*p2p4*p3p5/s**3)

      hard = hard*conhc

      return
      end