#ifdef GL_ES
precision mediump float;
#endif
//uniform sampler2D src;

uniform highp mat4 qt_Matrix;
uniform lowp float iGlobalTime;
uniform vec2 u_Resolution;
const int distance = 20;  //px
void main(){
    vec2 st = gl_FragCoord.xy;
    vec3 color = vec3(0.0);
    float xTime = iGlobalTime ;
    xTime = iGlobalTime * 4.0;
    float pct = 0.0;
    if(!(mod(float(st.x) , float(distance)) >= 0.001 || mod(float(st.y) , float(distance)) >= 0.001)) {
        discard;
        return;
    }
    else
        pct = 1.0;
    color = vec3(pct);
    color*= vec3(abs(sin(xTime)),abs(cos(xTime)),abs(sin(xTime)));

    gl_FragColor = vec4(color,1.0);
}
