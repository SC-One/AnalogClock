#ifdef GL_ES
precision mediump float;
#endif
//uniform sampler2D src;

uniform highp mat4 qt_Matrix;
uniform lowp float iGlobalTime;
uniform lowp float iTickLength;
uniform lowp float iRadius;
uniform vec2 u_Resolution;

float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.5);
    return smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*4.0);
}


void main(){
    vec2 st = gl_FragCoord.xy/u_Resolution;//normalized between [0 - 1]
//    vec3 color = vec3(0.0);
//    float xTime = iGlobalTime ;
//    xTime = iGlobalTime * 4.0;
//    float pct = 0.0;
//    if(!(mod(float(st.x) , float(distance)) >= 0.001 || mod(float(st.y) , float(distance)) >= 0.001)) {
//        discard;
//        return;
//    }
//    else
//        pct = 1.0;
//    color = vec3(pct);
//    color*= vec3(abs(sin(xTime)),abs(cos(xTime)),abs(sin(xTime)));

    vec3 color = vec3(circle(st,0.5));

    gl_FragColor = vec4( color, 1.0 );
}
