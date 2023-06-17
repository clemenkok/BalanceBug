#ifndef CONTROLLER_HPP_
#define CONTROLLER_HPP_

void controllerSetup();
double computeRollControllerOutput();
void setRollSetpoint(double newSetpoint);
void updateRollInput(double newInput);
double computeVeloControllerOutput();
void setVeloSetpoint(double newSetpoint);
void updateVeloInput(double newInput);
double getError();

class LowPassFilter
{
public:
    /**
     * @param Tf - Low pass filter time constant
     */
    LowPassFilter(double Tf, unsigned long timestamp_prev);
    ~LowPassFilter() = default;

    double operator() (double input, unsigned long current_time);
    double Tf; //!< Low pass filter time constant

protected:
    unsigned long timestamp_prev;  //!< Last execution timestamp
    double y_prev; //!< filtered value in previous execution step 
};

#endif
