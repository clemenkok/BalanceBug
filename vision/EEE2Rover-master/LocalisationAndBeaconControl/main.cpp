//#include <iostream>

enum State {
    IDLE,
    LOOKING_FOR_1ST_BALL,
    LOOKING_FOR_2ND_BALL,
    LOOKING_FOR_3RD_BALL,
    SEND_DISTANCES
};

int main() {
    State currentState = IDLE;
    
    while (true) {
        switch (currentState) {
            case IDLE:
                // Transition to the next state based on some condition or event
                currentState = LOOKING_FOR_1ST_BALL;
                // Turn on light for the first ball
                client.publish("esp/redball", "ON");
                break;
                
            case LOOKING_FOR_1ST_BALL:
                // Transition to the next state based on some condition or event
                currentState = LOOKING_FOR_2ND_BALL;
                // Turn on light for the second ball
                client.publish("esp/redball", "OFF");
                client.publish("esp/blueball", "ON");
                break;
                
            case LOOKING_FOR_2ND_BALL:
                // Transition to the next state based on some condition or event
                currentState = LOOKING_FOR_3RD_BALL;
                // Turn on light for the third ball
                client.publish("esp/blueball", "OFF");
                client.publish("esp/yellowball", "ON");
                break;
                
            case LOOKING_FOR_3RD_BALL:
                // Transition to the next state based on some condition or event
                currentState = SEND_DISTANCES;
                client.publish("esp/yellowball", "OFF");
                break;
            case SEND_DISTANCES:
                // Transition to the next state based on some condition or event
                currentState = IDLE;
                // perform calculation 
                client.publish("esp/localise", distances);
                break;
        }
        
        // Add any required conditions or events that trigger state transitions
        
        // Break the loop if a termination condition is met
        if (/* termination condition */) {
            break;
        }
    }
    
    return 0;
}
