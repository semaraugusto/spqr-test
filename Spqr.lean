import Spqr.Code.Funs
import Spqr.Code.FunsExternal
import Spqr.Code.Types
import Spqr.Code.TypesExternal
import Spqr.Math.Gf16.Basic
import Spqr.Math.Gf16.Field
import Spqr.Math.Gf16.Irreducible
import Spqr.Math.Gf2Poly.Basic
import Spqr.Math.Gf2Poly.NatRep
import Spqr.Math.Poly.ModByMonic
import Spqr.Specs.Encoding.Gf.GF16.Add
import Spqr.Specs.Encoding.Gf.GF16.AddAssign
import Spqr.Specs.Encoding.Gf.GF16.Eq
import Spqr.Specs.Encoding.Gf.GF16.Sub
import Spqr.Specs.Encoding.Gf.Reduce.PolyReduce
import Spqr.Specs.Encoding.Gf.Reduce.ReduceFromByte
import Spqr.Specs.Encoding.Gf.Unaccelerated.Mul
import Spqr.Specs.Encoding.Gf.Unaccelerated.PolyMul
import Spqr.Specs.Encoding.Polynomial.Pt.Deserialize
import Spqr.Specs.Encoding.Polynomial.Pt.Serialize

import Lean
import Std

open Lean Elab Command

elab "#gotcha" : command => do
  let dir ← IO.currentDir
  IO.println s!"stdout: {dir}"
  IO.eprintln s!"stderr: {dir}"

#gotcha
