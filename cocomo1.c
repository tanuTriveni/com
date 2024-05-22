#include <stdio.h>
#include <math.h>

// Constants for COCOMO formulas
const float A[] = {2.4, 3.0, 3.6};
const float B[] = {1.05, 1.12, 1.20};
const float T[] = {2.5, 2.5, 2.5}; // Time constant for organic, semi-detached, embedded

// Function to calculate effort
float calculate_effort(float size, int type) {
    return A[type] * pow(size, B[type]);
}

// Function to calculate time
float calculate_time(float effort, int type) {
    return T[type] * pow(effort, 0.333333);
}

// Function to classify project type
const char* classify_project(float size) {
    if (size < 50)
        return "Organic";
    else if (size < 300)
        return "Semi-Detached";
    else
        return "Embedded";
}

int main() {
    float size, effort, time;
    int type;

    printf("Enter the estimated size of the project (in KLOC): ");
    scanf("%f", &size);

    // Choose project type based on size
    const char* project_type = classify_project(size);

    if (project_type == "Organic")
        type = 0;
    else if (project_type == "Semi-Detached")
        type = 1;
    else
        type = 2;

    effort = calculate_effort(size, type);
    time = calculate_time(effort, type);

    printf("\nEffort Estimate: %.2f person-months\n", effort);
    printf("Time Estimate: %.2f months\n", time);
    printf("Project Type: %s\n", project_type);

    return 0;
}
