module ThermodynamicsBase

include("abstracts.jl")
include("constants.jl")
include("statestructs.jl")
include("eos_api.jl")

export AbstractPhaseState, AbstractSubstance, AbstractThermoBackend,
AbstractMixture, AbstractEquationOfState, AbstractMixingRules, AbstractProperty

export R, thermocalc, thermocalc!

end
