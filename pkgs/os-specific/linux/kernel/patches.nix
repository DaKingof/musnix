{ stdenv, fetchurl }:

let

  realtimePatch =
    { branch
    , kversion
    , pversion
    , url ? "https://www.kernel.org/pub/linux/kernel/projects/rt/${branch}/patch-${kversion}-${pversion}.patch.xz"
    , sha256
    }:
    { name  = "rt-${kversion}-${pversion}";
      patch = fetchurl {
        inherit url sha256;
      };
    };

in rec {

  realtimePatch_3_14 = realtimePatch
    { branch = "3.14";
      kversion = "3.14.57";
      pversion = "rt58";
      sha256 = "05sk0jwb38civmmaq44a2ygv8dl6k4aglj9kh6pwm52m2rdavbz5";
    };

  realtimePatch_3_18 = realtimePatch
    { branch = "3.18";
      kversion = "3.18.24";
      pversion = "rt22";
      sha256 = "039wzgh1f97h2rksa7vp2jk4nha0px2mb3760ikx309a401s0yag";
    };

  realtimePatch_4_0 = realtimePatch
    { branch = "4.0";
      kversion = "4.0.8";
      pversion = "rt6";
      sha256 = "0x3in9rjcw7lja902nj8647lhmxw3dsnav0xm2jg1irjicqk77p8";
    };

  realtimePatch_4_1 = realtimePatch
    { branch = "4.1";
      kversion = "4.1.15";
      pversion = "rt17";
      sha256 = "17bb6h44580srxh16m1p9z9s697rjvncv2h3648dpwjvy5mas4si";
    };

}