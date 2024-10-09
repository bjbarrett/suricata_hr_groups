library(dagitty)

dag1 <- 
  dagitty('dag {
  FocalHRA <- NeighHRA;
  FocalNDVI -> FocalHRA;
  FocalGS -> FocalHRA;
  FocalNDVI -> FocalInsectSnax;
  FocalInsectSnax -> FocalGS;
  FocalHRA -> PropOverlap;
  NeighHRA -> PropOverlap;
  NeighGS -> NeighHRA;
  NeighNDVI -> NeighHRA;
  NeighInsectSnax -> NeighGS;
  FocalSoilTypes -> FocalHRA; ###affects indirectly
  NeighSoilTypes -> NeighHRA; ###affects indirectly
  FocalSoilTypes -> FocalHRA;
  NeighSoilTypes -> NeighHRA;
  Rain -> NDVI;
  Rain -> NDVI;
  #Rain -> Cloud -> Movement;
  #Rain -> Cloud -> Movement;
  Temp -> Movement; #DPL, HRA how about inverts?
  Temp -> FocalNDVI; #(spike affected)
  Temp -> NeighNDVI;
  FocalGroupComp -> Movement -> HRA;
  FocalPropPeriodBS -> Movement;
  FocalGS -> FocalPropPeriodBS;
  NNNM -> GS;
  DomFemaleTenure -> DPL -> HRA;
  DomFemaleAge -> DomFemaleTenure; 
  DomFemaleTenure -> HRA; #group_senescene
  DomFemaleTenure -> FocalGS
  ###
  


  FocalInsectSnax[unobserved]
  FocalInsectSnax[outcome]
  FocalSoilTypes -> FocalHRA;
}')

plot(dag1)
