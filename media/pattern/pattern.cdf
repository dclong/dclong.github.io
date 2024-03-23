(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 8.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc.                                               *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       835,         17]
NotebookDataLength[     28108,        675]
NotebookOptionsPosition[     28447,        670]
NotebookOutlinePosition[     28883,        687]
CellTagsIndexPosition[     28840,        684]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"PatternExpectedTime", "::", "nprob"}], "=", 
   "\"\<All element of `1` are negative.\>\""}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"PatternExpectedTime", "::", "ndist"}], "=", 
   "\"\<The sum of `1` is greater than 1.\>\""}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"PatternExpectedTime", "::", "sp"}], "=", 
   "\"\<The sample space `1` has duplicated element(s).\>\""}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"PatternExpectedTime", "::", "nmatch"}], "=", 
   "\"\<The length of `1` does not match the length of `2`.\>\""}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"PatternExpectedTime", "[", 
   RowBox[{"pattern_", ",", "samspace_", ",", 
    RowBox[{"prob_:", "Null"}], ",", 
    RowBox[{"padj_:", "True"}]}], "]"}], ":=", "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{
   "the", " ", "algorithm", " ", "is", " ", "based", " ", "on", " ", 
    "martingales"}], "*)"}], 
  StyleBox["\[IndentingNewLine]",
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox[
   RowBox[{"(*", 
    RowBox[{"pattern", ":", " ", 
     RowBox[{
     "a", " ", "list", " ", "defining", " ", "the", " ", "pattern", " ", "to",
       " ", "be", " ", "observed"}]}], "*)"}],
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox["\[IndentingNewLine]",
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox[
   RowBox[{"(*", 
    RowBox[{"samspace", ":", " ", 
     RowBox[{
     "a", " ", "list", " ", "defining", " ", "the", " ", "sample", " ", 
      "space"}]}], "*)"}],
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox["\[IndentingNewLine]",
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox[
   RowBox[{"(*", 
    RowBox[{"prob", ":", " ", 
     RowBox[{"a", " ", "list", " ", "defining", " ", "probabilites"}]}], 
    "*)"}],
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox["\[IndentingNewLine]",
   FontColor->RGBColor[0, 0, 1]], 
  StyleBox[
   RowBox[{"(*", 
    RowBox[{
     RowBox[{"padj", ":", " ", "logical"}], ",", " ", 
     RowBox[{
     "whether", " ", "to", " ", "auto", " ", "adjust", " ", "argument", " ", 
      "prob", " ", "to", " ", "make", " ", "it", " ", "sum", " ", "to", " ", 
      "1"}]}], "*)"}],
   FontColor->RGBColor[0, 0, 1]], "\[IndentingNewLine]", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"nsample", ",", "npattern", ",", "i", ",", "j", ",", 
      RowBox[{"ResultProb", "=", 
       RowBox[{"{", "}"}]}], ",", "temp", ",", "expect", ",", "probs"}], 
     "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"nsample", "=", 
      RowBox[{"Length", "[", "samspace", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Length", "[", 
         RowBox[{"DeleteDuplicates", "[", "samspace", "]"}], "]"}], "<", 
        "nsample"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Message", "[", 
         RowBox[{
          RowBox[{"PatternExpectedTime", "::", "sp"}], ",", "samspace"}], 
         "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"prob", "===", "Null"}], ",", "\[IndentingNewLine]", 
       RowBox[{"probs", "=", 
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"1", "/", "nsample"}], ",", 
          RowBox[{"{", "nsample", "}"}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Length", "[", "prob", "]"}], "\[NotEqual]", "nsample"}], 
          ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Message", "[", 
            RowBox[{
             RowBox[{"PatternExpectedTime", "::", "nmatch"}], ",", "prob", 
             ",", "samspace"}], "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Min", "[", "prob", "]"}], "<", "0"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Message", "[", 
            RowBox[{
             RowBox[{"PatternExpectedTime", "::", "nprob"}], ",", "prob"}], 
            "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{"padj", ",", "\[IndentingNewLine]", 
          RowBox[{"probs", "=", 
           RowBox[{"prob", "/", 
            RowBox[{"Total", "[", "prob", "]"}]}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"Total", "[", "prob", "]"}], ">", "1"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Message", "[", 
               RowBox[{
                RowBox[{"PatternExpectedTime", "::", "ndist"}], ",", "prob"}],
                "]"}], ";", "\[IndentingNewLine]", 
              RowBox[{"Return", "[", "]"}]}], ",", "\[IndentingNewLine]", 
             RowBox[{"probs", "=", "prob"}]}], "\[IndentingNewLine]", "]"}], 
           ";"}]}], "\[IndentingNewLine]", "]"}], ";"}]}], 
      "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"(*", 
      RowBox[{
      "the", " ", "following", " ", "is", " ", "the", " ", "core", " ", 
       "algorithm"}], "*)"}], "\[IndentingNewLine]", 
     RowBox[{"npattern", "=", 
      RowBox[{"Length", "[", "pattern", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"For", "[", 
      RowBox[{
       RowBox[{"i", "=", "1"}], ",", 
       RowBox[{"i", "\[LessEqual]", "npattern"}], ",", 
       RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"AppendTo", "[", 
         RowBox[{"ResultProb", ",", 
          RowBox[{"probs", "[", 
           RowBox[{"[", 
            RowBox[{
             RowBox[{"Flatten", "[", 
              RowBox[{"Position", "[", 
               RowBox[{"samspace", ",", 
                RowBox[{"pattern", "[", 
                 RowBox[{"[", "i", "]"}], "]"}]}], "]"}], "]"}], "[", 
             RowBox[{"[", "1", "]"}], "]"}], "]"}], "]"}]}], "]"}], ";"}]}], 
      "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"expect", "=", "npattern"}], ";", "\[IndentingNewLine]", 
     RowBox[{"For", "[", 
      RowBox[{
       RowBox[{"i", "=", "1"}], ",", 
       RowBox[{"i", "\[LessEqual]", "npattern"}], ",", 
       RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"temp", "=", "1"}], ";", "\[IndentingNewLine]", 
        RowBox[{"For", "[", 
         RowBox[{
          RowBox[{"j", "=", "i"}], ",", 
          RowBox[{"j", "\[LessEqual]", "npattern"}], ",", 
          RowBox[{"j", "++"}], ",", "\[IndentingNewLine]", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"pattern", "[", 
              RowBox[{"[", "j", "]"}], "]"}], "\[Equal]", 
             RowBox[{"pattern", "[", 
              RowBox[{"[", 
               RowBox[{"j", "-", "i", "+", "1"}], "]"}], "]"}]}], ",", 
            "\[IndentingNewLine]", 
            RowBox[{"temp", "=", 
             RowBox[{"temp", "/", 
              RowBox[{"ResultProb", "[", 
               RowBox[{"[", "j", "]"}], "]"}]}]}], ",", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"temp", "=", "0"}], ";", "\[IndentingNewLine]", 
             RowBox[{"Break", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}]}], 
         "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"expect", "=", 
         RowBox[{"expect", "+", "temp", "-", "1"}]}]}]}], 
      "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"Return", "[", "expect", "]"}]}]}], "\[IndentingNewLine]", 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"PatternAdditionalExpectedTime", "[", 
   RowBox[{"pat_", ",", "gpat_", ",", "samspace_", ",", 
    RowBox[{"prob_:", "Null"}], ",", 
    RowBox[{"padj_:", "True"}]}], "]"}], ":=", "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{
    RowBox[{
    "calculate", " ", "the", " ", "expected", " ", "time", " ", "for", " ", 
     "a", " ", "pat", " ", "to", " ", "occur", " ", "given", " ", "that", " ",
      "gpat", " ", "already", " ", "occurs"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"it", "'"}], "s", " ", "essentially", " ", "based", " ", "on", 
     " ", "the", " ", "function", " ", 
     RowBox[{"PatternExpectedTime", "[", "]"}]}]}], "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"npat", ",", "ngpat", ",", "i", ",", "j", ",", "count", ",", 
      RowBox[{"win", "=", 
       RowBox[{"{", "}"}]}], ",", "temp", ",", "nsample", ",", "probs"}], 
     "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"nsample", "=", 
      RowBox[{"Length", "[", "samspace", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Length", "[", 
         RowBox[{"DeleteDuplicates", "[", "samspace", "]"}], "]"}], "<", 
        "nsample"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Message", "[", 
         RowBox[{
          RowBox[{"PatternExpectedTime", "::", "sp"}], ",", "samspace"}], 
         "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"prob", "===", "Null"}], ",", "\[IndentingNewLine]", 
       RowBox[{"probs", "=", 
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"1", "/", "nsample"}], ",", 
          RowBox[{"{", "nsample", "}"}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Length", "[", "prob", "]"}], "\[NotEqual]", "nsample"}], 
          ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Message", "[", 
            RowBox[{
             RowBox[{"PatternExpectedTime", "::", "nmatch"}], ",", "prob", 
             ",", "samspace"}], "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Min", "[", "prob", "]"}], "<", "0"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Message", "[", 
            RowBox[{
             RowBox[{"PatternExpectedTime", "::", "nprob"}], ",", "prob"}], 
            "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{"padj", ",", "\[IndentingNewLine]", 
          RowBox[{"probs", "=", 
           RowBox[{"prob", "/", 
            RowBox[{"Total", "[", "prob", "]"}]}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"Total", "[", "prob", "]"}], ">", "1"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Message", "[", 
               RowBox[{
                RowBox[{"PatternExpectedTime", "::", "ndist"}], ",", "prob"}],
                "]"}], ";", "\[IndentingNewLine]", 
              RowBox[{"Return", "[", "]"}]}], ",", "\[IndentingNewLine]", 
             RowBox[{"probs", "=", "prob"}]}], "\[IndentingNewLine]", "]"}], 
           ";"}]}], "\[IndentingNewLine]", "]"}], ";"}]}], 
      "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"npat", "=", 
      RowBox[{"Length", "[", "pat", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"ngpat", "=", 
      RowBox[{"Length", "[", "gpat", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"count", "=", 
      RowBox[{"ngpat", "+", "1", "-", "npat"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"count", "\[GreaterEqual]", "1"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"temp", "=", "1"}], ";", "\[IndentingNewLine]", 
        RowBox[{"For", "[", 
         RowBox[{
          RowBox[{"i", "=", "1"}], ",", 
          RowBox[{"i", "\[LessEqual]", "npat"}], ",", 
          RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
          RowBox[{"temp", "/=", 
           RowBox[{"probs", "[", 
            RowBox[{"[", 
             RowBox[{
              RowBox[{"Flatten", "[", 
               RowBox[{"Position", "[", 
                RowBox[{"samspace", ",", 
                 RowBox[{"pat", "[", 
                  RowBox[{"[", "i", "]"}], "]"}]}], "]"}], "]"}], "[", 
              RowBox[{"[", "1", "]"}], "]"}], "]"}], "]"}]}]}], 
         "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"temp", "-=", "1"}], ";", "\[IndentingNewLine]", 
        RowBox[{"For", "[", 
         RowBox[{
          RowBox[{"i", "=", "1"}], ",", 
          RowBox[{"i", "\[LessEqual]", "count"}], ",", 
          RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"For", "[", 
            RowBox[{
             RowBox[{"j", "=", "1"}], ",", 
             RowBox[{"j", "<=", "npat"}], ",", 
             RowBox[{"j", "++"}], ",", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"gpat", "[", 
                  RowBox[{"[", 
                   RowBox[{"i", "+", "j", "-", "1"}], "]"}], "]"}], "!=", 
                 RowBox[{"pat", "[", 
                  RowBox[{"[", "j", "]"}], "]"}]}], ",", 
                "\[IndentingNewLine]", 
                RowBox[{
                 RowBox[{"AppendTo", "[", 
                  RowBox[{"win", ",", 
                   RowBox[{"-", "1"}]}], "]"}], ";", "\[IndentingNewLine]", 
                 RowBox[{"Goto", "[", "next", "]"}], ";"}]}], 
               "\[IndentingNewLine]", "]"}], ";"}]}], "\[IndentingNewLine]", 
            "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"AppendTo", "[", 
            RowBox[{"win", ",", "temp"}], "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Label", "[", "next", "]"}], ";"}]}], 
         "\[IndentingNewLine]", "]"}], ";"}]}], "\[IndentingNewLine]", "]"}], 
     ";", "\[IndentingNewLine]", 
     RowBox[{"count", "=", 
      RowBox[{"Max", "[", 
       RowBox[{"1", ",", 
        RowBox[{"count", "+", "1"}]}], "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"For", "[", 
      RowBox[{
       RowBox[{"i", "=", "count"}], ",", 
       RowBox[{"i", "\[LessEqual]", "ngpat"}], ",", 
       RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"temp", "=", "1"}], ";", "\[IndentingNewLine]", 
        RowBox[{"For", "[", 
         RowBox[{
          RowBox[{"j", "=", "i"}], ",", 
          RowBox[{"j", "\[LessEqual]", "ngpat"}], ",", 
          RowBox[{"j", "++"}], ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"gpat", "[", 
               RowBox[{"[", "j", "]"}], "]"}], "\[Equal]", 
              RowBox[{"pat", "[", 
               RowBox[{"[", 
                RowBox[{"j", "-", "i", "+", "1"}], "]"}], "]"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"temp", "/=", 
              RowBox[{"probs", "[", 
               RowBox[{"[", 
                RowBox[{
                 RowBox[{"Flatten", "[", 
                  RowBox[{"Position", "[", 
                   RowBox[{"samspace", ",", 
                    RowBox[{"pat", "[", 
                    RowBox[{"[", 
                    RowBox[{"j", "-", "i", "+", "1"}], "]"}], "]"}]}], "]"}], 
                  "]"}], "[", 
                 RowBox[{"[", "1", "]"}], "]"}], "]"}], "]"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"temp", "=", "0"}], ";", "\[IndentingNewLine]", 
              RowBox[{"Break", "[", "]"}], ";"}]}], "\[IndentingNewLine]", 
            "]"}], ";"}]}], "\[IndentingNewLine]", "]"}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"AppendTo", "[", 
         RowBox[{"win", ",", 
          RowBox[{"temp", "-", "1"}]}], "]"}], ";"}]}], "\[IndentingNewLine]",
       "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"win", "=", 
      RowBox[{"Total", "[", "win", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"PatternExpectedTime", "[", 
       RowBox[{"pat", ",", "samspace", ",", "probs", ",", "padj"}], "]"}], 
      "-", "win", "-", "ngpat"}]}]}], "\[IndentingNewLine]", 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"PatternFirstComeOutProbability", "::", "patnum"}], "=", 
   "\"\<Argument `1` requires 2 or more elements.\>\""}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"PatternFirstComeOutProbability", "[", 
   RowBox[{"patterns_", ",", "samspace_", ",", 
    RowBox[{"prob_:", "Null"}], ",", 
    RowBox[{"padj_:", "True"}]}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"npat", ",", 
      RowBox[{"A", "=", 
       RowBox[{"{", "}"}]}], ",", 
      RowBox[{"row", "=", 
       RowBox[{"{", "}"}]}], ",", 
      RowBox[{"b", "=", 
       RowBox[{"{", "}"}]}], ",", "i", ",", "j", ",", "nsample", ",", 
      "probs"}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{"(*", 
     RowBox[{
     "patterns", " ", "is", " ", "a", " ", "list", " ", "which", " ", 
      "contains", " ", "patterns", " ", "to", " ", "be", " ", "compared"}], 
     "*)"}], "\[IndentingNewLine]", 
    RowBox[{"(*", 
     RowBox[{
     "dist", " ", "is", " ", "list", " ", "which", " ", "specifies", " ", "a",
       " ", "discrete", " ", "distribution"}], "*)"}], "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"npat", "=", 
      RowBox[{"Length", "[", "patterns", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"npat", "<", "2"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Message", "[", 
         RowBox[{
          RowBox[{"PatternFirstComeOutProbability", "::", "patnum"}], ",", 
          "patterns"}], "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"nsample", "=", 
      RowBox[{"Length", "[", "samspace", "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Length", "[", 
         RowBox[{"DeleteDuplicates", "[", "samspace", "]"}], "]"}], "<", 
        "nsample"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"Message", "[", 
         RowBox[{
          RowBox[{"PatternExpectedTime", "::", "sp"}], ",", "samspace"}], 
         "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"prob", "===", "Null"}], ",", "\[IndentingNewLine]", 
       RowBox[{"probs", "=", 
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"1", "/", "nsample"}], ",", 
          RowBox[{"{", "nsample", "}"}]}], "]"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Length", "[", "prob", "]"}], "\[NotEqual]", "nsample"}], 
          ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Message", "[", 
            RowBox[{
             RowBox[{"PatternExpectedTime", "::", "nmatch"}], ",", "prob", 
             ",", "samspace"}], "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"Min", "[", "prob", "]"}], "<", "0"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Message", "[", 
            RowBox[{
             RowBox[{"PatternExpectedTime", "::", "nprob"}], ",", "prob"}], 
            "]"}], ";", "\[IndentingNewLine]", 
           RowBox[{"Return", "[", "]"}]}]}], "\[IndentingNewLine]", "]"}], 
        ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{"padj", ",", "\[IndentingNewLine]", 
          RowBox[{"probs", "=", 
           RowBox[{"prob", "/", 
            RowBox[{"Total", "[", "prob", "]"}]}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"Total", "[", "prob", "]"}], ">", "1"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Message", "[", 
               RowBox[{
                RowBox[{"PatternExpectedTime", "::", "ndist"}], ",", "prob"}],
                "]"}], ";", "\[IndentingNewLine]", 
              RowBox[{"Return", "[", "]"}]}], ",", "\[IndentingNewLine]", 
             RowBox[{"probs", "=", "prob"}]}], "\[IndentingNewLine]", "]"}], 
           ";"}]}], "\[IndentingNewLine]", "]"}], ";"}]}], 
      "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"A", "=", 
      RowBox[{"Table", "[", 
       RowBox[{"0", ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "1", ",", "npat"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "1", ",", "npat"}], "}"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"For", "[", 
      RowBox[{
       RowBox[{"i", "=", "1"}], ",", 
       RowBox[{"i", "\[LessEqual]", "npat"}], ",", 
       RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"For", "[", 
         RowBox[{
          RowBox[{"j", "=", "1"}], ",", 
          RowBox[{"j", "\[LessEqual]", "npat"}], ",", 
          RowBox[{"j", "++"}], ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "\[Equal]", "i"}], ",", 
             RowBox[{"Continue", "[", "]"}]}], "]"}], ";", 
           "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"A", "[", 
             RowBox[{"[", 
              RowBox[{"i", ",", "j"}], "]"}], "]"}], "=", 
            RowBox[{"PatternAdditionalExpectedTime", "[", 
             RowBox[{
              RowBox[{"patterns", "[", 
               RowBox[{"[", "i", "]"}], "]"}], ",", 
              RowBox[{"patterns", "[", 
               RowBox[{"[", "j", "]"}], "]"}], ",", "samspace", ",", "probs", 
              ",", "padj"}], "]"}]}], ";"}]}], "\[IndentingNewLine]", "]"}], 
        ";"}]}], "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"A", "=", 
      RowBox[{"Join", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{"1", ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "npat"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1"}], "}"}]}], "]"}], ",", "A", ",", "2"}], 
       "]"}]}], ";", "\[IndentingNewLine]", 
     RowBox[{"row", "=", 
      RowBox[{"Table", "[", 
       RowBox[{"1", ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "npat"}], "}"}]}], "]"}]}], ";", 
     "\[IndentingNewLine]", 
     RowBox[{"PrependTo", "[", 
      RowBox[{"row", ",", "0"}], "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"AppendTo", "[", 
      RowBox[{"A", ",", "row"}], "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"For", "[", 
      RowBox[{
       RowBox[{"i", "=", "1"}], ",", 
       RowBox[{"i", "\[LessEqual]", "npat"}], ",", 
       RowBox[{"i", "++"}], ",", "\[IndentingNewLine]", 
       RowBox[{"AppendTo", "[", 
        RowBox[{"b", ",", 
         RowBox[{"PatternExpectedTime", "[", 
          RowBox[{
           RowBox[{"patterns", "[", 
            RowBox[{"[", "i", "]"}], "]"}], ",", "samspace", ",", "probs", 
           ",", "padj"}], "]"}]}], "]"}]}], "\[IndentingNewLine]", "]"}], ";",
      "\[IndentingNewLine]", 
     RowBox[{"AppendTo", "[", 
      RowBox[{"b", ",", "1"}], "]"}], ";", "\[IndentingNewLine]", 
     RowBox[{"Return", "[", 
      RowBox[{"LinearSolve", "[", 
       RowBox[{"A", ",", "b"}], "]"}], "]"}], ";"}]}], "\[IndentingNewLine]", 
   "]"}]}]}], "Input",
 CellChangeTimes->{
  3.4969725103631096`*^9, {3.4969725646652155`*^9, 3.496972625604701*^9}, {
   3.496972763518589*^9, 3.496972776709344*^9}, {3.496974885029933*^9, 
   3.4969749221540565`*^9}, {3.496974976154145*^9, 3.496975082004199*^9}, {
   3.4969752928452587`*^9, 3.4969752940213256`*^9}, {3.4969757875095515`*^9, 
   3.4969759316797976`*^9}, {3.4969760485164804`*^9, 3.496976058489051*^9}, {
   3.496976271029207*^9, 3.4969763367089643`*^9}, {3.49697645535175*^9, 
   3.4969765246307125`*^9}, {3.4969765559195023`*^9, 3.496976793510092*^9}, {
   3.496977038406099*^9, 3.4969770444104424`*^9}, 3.496977093702262*^9, {
   3.4969771268181553`*^9, 3.496977227262901*^9}, {3.496977262933941*^9, 
   3.496977341831454*^9}, {3.49697742253607*^9, 3.4969774285864162`*^9}, {
   3.496977513771288*^9, 3.4969775443480372`*^9}, {3.496977596358012*^9, 
   3.496977674318471*^9}, {3.496978008703597*^9, 3.496978049954956*^9}, {
   3.4969780927264023`*^9, 3.4969781383870144`*^9}, {3.4969782648722486`*^9, 
   3.49697846613276*^9}, {3.496978572342835*^9, 3.4969786643840995`*^9}, {
   3.4969786959649057`*^9, 3.4969787549172773`*^9}, {3.4969789421499867`*^9, 
   3.496978981753252*^9}, 3.496979013089044*^9, {3.4969791910042205`*^9, 
   3.496979194481419*^9}, {3.4969792352507515`*^9, 3.4969793480842047`*^9}, {
   3.496979575517213*^9, 3.496979576450267*^9}, {3.5037568533893127`*^9, 
   3.503756929790683*^9}, {3.5037569832157383`*^9, 3.5037570065690737`*^9}, {
   3.503757038882922*^9, 3.503757350629753*^9}, {3.5037574977961707`*^9, 
   3.503757498550214*^9}, {3.5037582574566207`*^9, 3.5037582654410777`*^9}, 
   3.5037584158026776`*^9, 3.503758529737194*^9, {3.503758567664364*^9, 
   3.5037585727986574`*^9}, {3.5037587444384747`*^9, 
   3.5037587665067368`*^9}, {3.5037596386296196`*^9, 
   3.5037596675822754`*^9}, {3.503771304681859*^9, 3.5037713201397433`*^9}, {
   3.503779764872754*^9, 3.503779766555851*^9}, {3.5037813213667808`*^9, 
   3.503781436628373*^9}, {3.5037819701788907`*^9, 3.503781984166691*^9}, {
   3.503782014992454*^9, 3.5037820155074835`*^9}, {3.503782362059305*^9, 
   3.503782439496734*^9}, {3.5037825547363253`*^9, 3.503782565739955*^9}, {
   3.5037826236952696`*^9, 3.5037826516588693`*^9}, {3.5037827592750244`*^9, 
   3.5037827965901585`*^9}, {3.5037889473369617`*^9, 
   3.5037889923885384`*^9}, {3.5037890637256184`*^9, 
   3.5037890645856676`*^9}, {3.5037891346836767`*^9, 3.503789141821085*^9}, {
   3.5037891720388136`*^9, 3.5037892066197915`*^9}, {3.503841780697513*^9, 
   3.503841796861438*^9}, {3.5038418334735317`*^9, 3.5038418608230963`*^9}, {
   3.504265830452182*^9, 3.504265831060217*^9}}]
},
WindowSize->{1264, 633},
WindowMargins->{{28, Automatic}, {-9, Automatic}},
Magnification:>FEPrivate`If[
  FEPrivate`Equal[FEPrivate`$VersionNumber, 6.], 1.5, 1.5 Inherited],
FrontEndVersion->"8.0 for Linux x86 (64-bit) (October 10, 2011)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1235, 30, 27208, 638, 4553, "Input"]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 0vDA2C2NNXjDTBgolpI#46Hq *)
