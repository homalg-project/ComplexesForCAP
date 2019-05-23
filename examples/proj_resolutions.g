LoadPackage( "ComplexesForCAP" );;
LoadPackage( "ModulePresentations" );;
LoadPackage( "GradedModulePresentations" );;
LoadPackage( "RingsForHomalg" );;

R := HomalgFieldOfRationalsInSingular( )*"x,y,z";;
cat := LeftPresentations( R: FinalizeCategory := false );
M := AsLeftPresentation( HomalgMatrix( "[ [ x ], [ y ], [ z ] ]", 3, 1, R ) );
#! <An object in Category of left presentations of Q[x,y,z]>
CM := StalkCochainComplex( M, 0 );
#! <A bounded object in Cochain complexes category over Category of left 
#! presentations of Q[x,y,z] with active lower bound -1 and active upper bound 1.>
P_M := ProjectiveResolution( M  );
P_CM := ProjectiveResolution(CM);


# Let V be a variety defined by the ideal I = < x^2 + y^2 - z >, then then the coordinate ring of V is R/I is regular, which implies that it has 
# finite global dimension. Let us test that for module M := R/<x,y,z> ( i.e., M = coker( R^3 --(x y z)^tr---> R^1 ) ).

relations := [ "x^2 + y^2 - z"/R ];
R_ := R/relations;
L := AsLeftPresentation( HomalgMatrix( "[ [ x ], [ y ], [ z ] ]", 3, 1, R_ ) );
CL := StalkCochainComplex( L, 0 );
p_L := ProjectiveResolution( L  );
p_CL := ProjectiveResolution( CL );

# If R is noetherian graded with finite krull dimension then R/I has finite global dimension iff I is generated by linear forms, let us test this 

S := GradedRing( HomalgFieldOfRationalsInSingular( )*"x,y,z" );;
SetWeightsOfIndeterminates( S, [ 1, 1, 0 ] );

relations := [ "x^2 + y^2 - z^2"/S ];
S_ := S/relations;
N := AsGradedLeftPresentation( HomalgMatrix( "[ [ x ], [ y ], [ z ] ]", 3, 1, S_ ), [ 0 ] );
CN := StalkCochainComplex( N, 0 );
p_N := ProjectiveResolution( N );
p_CN := ProjectiveResolution( CN );
