{
  description = ''Nim wrappers for ESP-IDF (ESP32)'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nesper-0_5_0.flake = false;
  inputs.src-nesper-0_5_0.owner = "elcritch";
  inputs.src-nesper-0_5_0.ref   = "refs/tags/0.5.0";
  inputs.src-nesper-0_5_0.repo  = "nesper";
  inputs.src-nesper-0_5_0.type  = "github";
  
  inputs."msgpack4nim".dir   = "nimpkgs/m/msgpack4nim";
  inputs."msgpack4nim".owner = "riinr";
  inputs."msgpack4nim".ref   = "flake-pinning";
  inputs."msgpack4nim".repo  = "flake-nimble";
  inputs."msgpack4nim".type  = "github";
  inputs."msgpack4nim".inputs.nixpkgs.follows = "nixpkgs";
  inputs."msgpack4nim".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."stew".dir   = "nimpkgs/s/stew";
  inputs."stew".owner = "riinr";
  inputs."stew".ref   = "flake-pinning";
  inputs."stew".repo  = "flake-nimble";
  inputs."stew".type  = "github";
  inputs."stew".inputs.nixpkgs.follows = "nixpkgs";
  inputs."stew".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nesper-0_5_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nesper-0_5_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}