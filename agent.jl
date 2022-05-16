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

model = AgentBasedModel(Schelling, space; properties) 

