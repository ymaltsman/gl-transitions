// Author: Yoni Maltsman @friendlyspinach
// License: MIT

uniform float r_strength; // = 1.0
uniform float g_strength; // = 1.0
uniform float b_strength; // = 1.0

float my_mod(float x, float m){
  float first = mod(x, m);
  float second = mod(first + m, m);
  return second;
}

vec4 transition (vec2 uv) {
  vec4 from = getFromColor(uv);
  vec4 to = getToColor(uv);
  if (progress > 0.0){
    from.r = my_mod(from.r*pow(3.0*r_strength, 1.0 + progress), 1.0);
    from.g = my_mod(from.g*pow(3.0*g_strength, 1.0 +progress), 1.0);
    from.b = my_mod(from.b*pow(3.0*b_strength, 1.0 + progress), 1.0);
  }
  return mix(from, to, progress);
}
