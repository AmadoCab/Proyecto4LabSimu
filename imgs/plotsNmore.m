(* ::Package:: *)

<<MaTeX``


texStyle={FontFamily->"Latin Modern Roman",FontSize->12};


pwd=Directory[];


Print[pwd]


(* ::Title:: *)
(*Gr\[AAcute]ficas para proyecto (y un poco m\[AAcute]s)*)


(* ::Author:: *)
(*Amado Cabrera, Denilson Mendoza y Mariana P\[EAcute]rez*)


(* ::Section:: *)
(*Importando datos*)


(* ::Subsection:: *)
(*Soluci\[OAcute]n exacta de la EDO*)


edo=y/.DSolve[{y'[x]==0.16y[x],y[0]==367},y,x][[1]]


(* ::Subsection:: *)
(*M\[EAcute]todo de Euler*)


TableForm[#,TableHeadings->{None,{"i","xi","yi"}}]&@((euler=Import[pwd<>"/../data/data-euler.csv","Data"][[2;;]])[[1;;5]]~Join~{{"...","...","..."}})


(* ::Text:: *)
(*El error despu\[EAcute]s de 100 iteraciones viene dado por*)


(eulerEr=Abs[#[[;;,3]]-edo/@#[[;;,2]]]&@euler)//Last


Export[pwd<>"/../data/data-eulerEr.csv",(euler\[Transpose]~Join~{eulerEr})\[Transpose],"Table"]


(* ::Subsection:: *)
(*M\[EAcute]todo de Taylor*)


TableForm[#,TableHeadings->{None,{"i","xi","yi"}}]&@((taylor=Import[pwd<>"/../data/data-taylor.csv","Data"][[2;;]])[[1;;5]]~Join~{{"...","...","..."}})


(* ::Text:: *)
(*El error despu\[EAcute]s de 100 iteraciones viene dado por*)


(taylorEr=Abs[#[[;;,3]]-edo/@#[[;;,2]]]&@taylor)//Last


Export[pwd<>"/../data/data-taylorEr.csv",(taylor\[Transpose]~Join~{taylorEr})\[Transpose],"Table"]


(* ::Subsection:: *)
(*M\[EAcute]todo Runge-Kutta*)


TableForm[#,TableHeadings->{None,{"i","xi","yi"}}]&@((rungekutta=Import[pwd<>"/../data/data-runge_kutta.csv","Data"][[2;;]])[[1;;5]]~Join~{{"...","...","..."}})


(* ::Text:: *)
(*El error despu\[EAcute]s de 100 iteraciones viene dado por*)


(rungekuttaEr=Abs[#[[;;,3]]-edo/@#[[;;,2]]]&@rungekutta)//Last


Export[pwd<>"/../data/data-rungekuttaEr.csv",(rungekutta\[Transpose]~Join~{rungekuttaEr})\[Transpose],"Table"]


(* ::Section:: *)
(*Gr\[AAcute]ficas*)


(* ::Subsection:: *)
(*M\[EAcute]todo de Euler*)


eulerG=ListLinePlot[eulerEr,
BaseStyle->texStyle,
PlotLabel->"Error en el m\[EAcute]todo de Euler",
AxesLabel->(MaTeX[#,FontSize->16]&/@{"i","\\varepsilon"}),
Mesh->All]


Export[pwd<>"/plot-euler.pdf",eulerG]


(* ::Subsection:: *)
(*M\[EAcute]todo de Taylor*)


taylorG=ListLinePlot[taylorEr,
BaseStyle->texStyle,
PlotLabel->"Error en el m\[EAcute]todo de Taylor",
AxesLabel->(MaTeX[#,FontSize->16]&/@{"i","\\varepsilon"}),
Mesh->All]


Export[pwd<>"/plot-taylor.pdf",taylorG]


(* ::Subsection:: *)
(*M\[EAcute]todo de Runge-Kutta*)


rungekuttaG=ListLinePlot[rungekuttaEr,
BaseStyle->texStyle,
PlotLabel->"Error en el m\[EAcute]todo de Runge-Kutta",
AxesLabel->(MaTeX[#,FontSize->16]&/@{"i","\\varepsilon"}),
Mesh->All]


Export[pwd<>"/plot-runge_kutta.pdf",rungekuttaG]


(* ::Section:: *)
(*Comparativa gr\[AAcute]fica entre m\[EAcute]todos *)


comp=ListLinePlot[{
euler[[;;,2;;]],
taylor[[;;,2;;]],
rungekutta[[;;,2;;]]
},
BaseStyle->texStyle,
AxesLabel->(MaTeX[#,FontSize->16]&/@{"x","y"}),
PlotLegends->Placed[LineLegend[{"Euler","Taylor","Runge-Kutta"},LegendFunction->Panel],{0.2,0.8}]
]


Export[pwd<>"/plot-comp.pdf",comp]
