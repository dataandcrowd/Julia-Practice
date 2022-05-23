using VegaLite, VegaDatasets, DataFrames

# 맛보기!
dataset("cars") |>
@vlplot(
    :point,
    x=:Horsepower,
    y=:Miles_per_Gallon,
    color=:Origin,
    width=400,
    height=400
)

data |>
@vlplot(:point, x=:Miles_per_Gallon, y=:Horsepower, color="Cylinders:o")



######################
us10m = dataset("us-10m")

unemployment = dataset("unemployment")

@vlplot(
    :geoshape,
    width=500, height=300,
    data={
        values=us10m,
        format={
            type=:topojson,
            feature=:counties
        }
    },
    transform=[{
        lookup=:id,
        from={
            data=unemployment,
            key=:id,
            fields=["rate"]
        }
    }],
    projection={
        type=:albersUsa
    },
    color="rate:q"
)