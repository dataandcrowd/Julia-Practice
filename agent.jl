#using Pkg; Pkg.add("Agents")
using Agents
### Step 1: decide space
space = GridSpace((10, 10); periodic = false)

### Step 2: make agent type
mutable struct Schelling <: AbstractAgent
    id::Int            
    pos::NTuple{2, Int} 
    group::Int        
    happy::Bool         
end


Schelling
space
properties = Dict(:min_to_be_happy => 3)

scheduler = Schedulers.randomly

model = AgentBasedModel(Schelling, space; properties, scheduler) 

using Random # for reproducibility
function initialize(; N = 320, M = 20, min_to_be_happy = 3, seed = 125)
    space = GridSpace((M, M), periodic = false)
    properties = Dict(:min_to_be_happy => min_to_be_happy)
    rng = Random.MersenneTwister(seed)
    
    
    
    model = ABM(
        SchellingAgent, space;
        properties, rng, scheduler = Schedulers.randomly
    )
end