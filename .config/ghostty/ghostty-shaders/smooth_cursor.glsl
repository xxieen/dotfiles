#version 450

// This shader creates a smooth, pulsing cursor effect.

// The output color for the current fragment.
layout(location = 0) out vec4 fragColor;

// The input texture from the previous shader stage (the terminal content).
layout(binding = 0) uniform sampler2D iChannel0;

// Ghostty's built-in uniforms.
layout(std140, binding = 1) uniform UBO {
    // The current time, in seconds.
    float iTime;
    // The resolution of the output display.
    vec2 iResolution;
    // The color of the cursor.
    vec4 iCursorColor;
    // The position of the cursor, in pixels.
    vec4 iCursor;
    // The frame number.
    int iFrame;
};

void main() {
    // Get the texture coordinates for the current fragment.
    vec2 uv = gl_FragCoord.xy / iResolution.xy;

    // Sample the color from the terminal content.
    vec4 terminalColor = texture(iChannel0, uv);

    // Check if the current fragment is within the cursor's bounds.
    if (gl_FragCoord.x >= iCursor.x && gl_FragCoord.x <= iCursor.x + iCursor.z &&
        gl_FragCoord.y >= iCursor.y && gl_FragCoord.y <= iCursor.y + iCursor.w) {

        // Create a smooth, pulsing alpha value using a sine wave.
        // The speed of the pulse can be adjusted by changing the multiplier of iTime.
        float alpha = (sin(iTime * 5.0) + 1.0) / 2.0;

        // Smooth the alpha transition to avoid a harsh cutoff.
        alpha = smoothstep(0.1, 0.9, alpha);

        // Mix the cursor color with the terminal color based on the calculated alpha.
        fragColor = mix(terminalColor, iCursorColor, alpha);
    } else {
        // If not in the cursor, just output the original terminal color.
        fragColor = terminalColor;
    }
}
