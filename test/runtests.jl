using Test

struct mything <: AbstractEquationOfState
    name::AbstractString
end
struct mything2 <: AbstractPhaseState
    name::AbstractString
end
struct mything3 <: AbstractProperty
    name::AbstractString
end

Base.show(a::mything) = a.name
Base.show(b::mything2) = b.name
Base.show(c::mything3) = c.name

#function thermocalc(st::AbstractPhaseState, eos::AbstractEquationOfState, p::AbstractProperty)
#println("We're sorry, the property $show(p) isn't implemented for $show(st) , using the $show(eos) equation of state.") end
@test thermocalc(mything2("Generic Phase State"), mything("Generic EOS"), mything3("Generic Property"))
