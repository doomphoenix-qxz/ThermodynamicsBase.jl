module ThermodynamicsBase

include("abstracts.jl")
include("constants.jl")

export AbstractPhaseState, AbstractSubstance, AbstractThermoBackend,
AbstractMixture, AbstractEquationOfState, AbstractMixingRules, AbstractProperty

export R, thermocalc, thermocalc!

end
