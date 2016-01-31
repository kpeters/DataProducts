## Shiny server.R file for the John Hopkins Data Products course project on Coursera

library(ggplot2)

## define variables
x_mass <- seq(40, 140, by = 0.1)
y_height <- seq(1.30, 2.30, by = 0.001)
mass_start <- 70.0
height_start <- 1.78
BMI <- mass_start/height_start^2 # BMI = mass/height^2

# create df to hold data for graph
nr.rep <- 5 # number of repetitions
df <- data.frame(mass=rep(x_mass,each=nr.rep), bmi=rep(c(7.5,18.5,25,30,40),
        length.out=length(x_mass)*nr.rep),
        height=rep(0,length.out=length(x_mass)*nr.rep))

#for loop to define bmi chart lines
for (i in 1:nrow(df)){
    # bmi <-  mass/height^2
    # bmi* height^2 = mass
    # height^2 = mass/bmi
    # height = sqrt(mass/bmi)
    df$height[i] <- sqrt(df$mass[i]/df$bmi[i])
}

## Create graph and output text
shinyServer(
    function(input, output){
        output$newBMIchart <- renderPlot({
            z <- ggplot(df, aes(x=mass, y=height, group=bmi, fill=as.factor(bmi)))
            z <- z + xlab("Mass (kg)") + ylab("Height (m)")
            z <- z + geom_area(position="identity") 
            z <- z + coord_cartesian(ylim=c(1.30, 2.30))
            z <- z + ggtitle("BMI chart")
            z <- z + scale_fill_manual(values= c("khaki2","limegreen","darkorange","orangered2","orangered4"),
                                       name="BMI range",
                                       labels=c("underweight (<18.5)",
                                                "normal weight (18.5-25)",
                                                "slight overweight (25-30)",
                                                "overweight (30-40)",
                                                "obese (40+)")) 
            mass <- input$mass
            height <- input$height
            BMI <- mass/height^2
            df_bmi <- data.frame(mass=mass,height=height)
            z <- z + geom_point(aes(x=df_bmi$mass, y=df_bmi$height), color="blue")
            z <- z + annotate("text", x=50, y=2.2, label="your BMI = ")
            z <- z + annotate("text", x=59, y=2.2, label=round(BMI, 1))
            print(z)
        })
        output$BMItext1 <- renderUI({
            HTML(paste(" 'The Body Mass Index (BMI) is an attempt to quantify 
                the amount of tissue mass (muscle, fat and bone) in an individual,
                and then categorize that person as", em("underweight"),
                " (bmi < 18.5) ,", em("normal weight"), " (bmi 18.5-25) ,", 
                em("slight overweight"), " (bmi 25-30) , ",em("overweight"), 
                " (bmi 30-40) , or", em("obese"), " (bmi 40+) , based on that value.'",
                '<br/>'," Source: Dutch and English wiki on BMI"))

            
        })

    }
)