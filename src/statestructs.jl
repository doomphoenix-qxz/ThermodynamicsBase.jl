# This is an idea for how to package thermodynamic states.
# Here's my rationale for splittlng it up like this:
# There are a lot of possible thermodynamic and transport properties. At any moment,
# some of those may have been calculated by a program and others may not have been.
# That's why all of the fields in these structs are Union{T_, Missing}.
# The structs themselves group properties by groups that indicate "If I know at
# least one or two of these properties, I can reasonably expect that I would be
# able to calculate the others if I wanted to."

struct MinimalState{T_} where T_ <: AbstractFloat
    P::Union{T_, Missing}
    V::Union{T_, Missing}
    ρ::Union{T_, Missing}
    T::Union{T_, Missing}
    Cp::Union{T_, Missing}
end

MinimalState{T_}() where T_ = MinimalState{T_}(missing, missing, missing, missing, missing)

struct TherodynamicPotentialsState{T_} where T_ <: AbstractFloat
    S::Union{T_, Missing}
    U::Union{T_, Missing}
    H::Union{T_, Missing}
    A::Union{T_, Missing}
    G::Union{T_, Missing}
end

TherodynamicPotentialsState{T_}() where T_ = TherodynamicPotentialsState{T_}(missing, missing, missing, missing, missing)

struct FullPotentialsState{T_} where T_ <: AbstractFloat
    minstate::MinimalState{T_}
    potentials::TherodynamicPotentialsState{T_}
end

MinimalState() = MinimalState(missing, missing, missing, missing, missing)

struct ChemicalState{T_} where T_ <: AbstractFloat
    μ::Union{T_, Missing}
    xᵢ::Union{T_, Missing}
    f::Union{T_, Missing}
    ϕ::Union{T_, Missing}
    aᵢ::Union{T_, Missing}
    γᵢ::Union{T_, Missing}
end

ChemicalState{T_}() where T_ = ChemicalState{T_}(missing, missing, missing, missing, missing)

struct FullChemicalState{T_} where T_ <: AbstractFloat
    minstate::MinimalState{T_}
    potentials::TherodynamicPotentialsState{T_}
    chemstate::ChemicalState{T_}
end



struct TransportPropertiesState{T_} where T_ <: AbstractFloat
    λ::Union{T_, Missing}
    μ::Union{T_, Missing}
    ν::Union{T_, Missing}
    α::Union{T_, Missing}
    Pr::Union{T_, Missing}
end

TransportPropertiesState{T_}() where T_ = TransportPropertiesState{T_}(missing, missing, missing, missing, missing)

struct FullState{T_} where T_ <: AbstractFloat
    minstate::MinimalState{T_}
    potentials::TherodynamicPotentialsState{T_}
    chemstate::ChemicalState{T_}
    transtate::TransportPropertiesState{T_}
end
