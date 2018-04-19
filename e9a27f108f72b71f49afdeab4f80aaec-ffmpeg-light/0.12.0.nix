{ compiler, flags ? {}, hsPkgs, pkgs, system }:
let
    _flags = {
      builddemo = false;
      buildrasterdemo = false;
      buildvplaydemo = false;
    } // flags;
    in {
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ffmpeg-light";
          version = "0.12.0";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2014 Anthony Cowley";
        maintainer = "acowley@gmail.com";
        author = "Anthony Cowley";
        homepage = "http://github.com/acowley/ffmpeg-light";
        url = "";
        synopsis = "Minimal bindings to the FFmpeg library.";
        description = "Stream frames from an encoded video, or stream frames to\na video output file. To read the first frame from\nan @h264@-encoded file into a JuicyPixels\n@Maybe DynamicImage@,\n\n> import Codec.FFmpeg\n> import Codec.Picture\n> import Control.Applicative\n>\n> go :: IO (Maybe DynamicImage)\n> go = do (getFrame, cleanup) <- imageReader \"myVideo.mov\"\n>         (fmap ImageRGB8 <\$> getFrame) <* cleanup\n\nTested with FFmpeg 3.1 - 3.2.4";
        buildType = "Simple";
      };
      components = {
        ffmpeg-light = {
          depends  = [
            hsPkgs.base
            hsPkgs.either
            hsPkgs.exceptions
            hsPkgs.vector
            hsPkgs.transformers
            hsPkgs.mtl
            hsPkgs.JuicyPixels
            hsPkgs.bytestring
          ];
        };
        exes = {
          demo = {
            depends  = [
              hsPkgs.base
              hsPkgs.vector
              hsPkgs.mtl
              hsPkgs.transformers
              hsPkgs.JuicyPixels
            ] ++ pkgs.lib.optionals _flags.builddemo [
              hsPkgs.ffmpeg-light
              hsPkgs.time
            ];
          };
          raster = {
            depends  = [
              hsPkgs.base
              hsPkgs.vector
              hsPkgs.mtl
              hsPkgs.transformers
              hsPkgs.JuicyPixels
            ] ++ pkgs.lib.optionals _flags.buildrasterdemo [
              hsPkgs.ffmpeg-light
              hsPkgs.Rasterific
            ];
          };
          vplay = {
            depends  = [
              hsPkgs.base
              hsPkgs.mtl
              hsPkgs.transformers
              hsPkgs.text
              hsPkgs.monad-loops
              hsPkgs.bytestring
            ] ++ pkgs.lib.optionals _flags.buildvplaydemo [
              hsPkgs.ffmpeg-light
              hsPkgs.sdl2
            ];
          };
        };
      };
    }