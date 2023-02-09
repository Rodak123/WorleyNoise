#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;

uniform vec3 points[128];
uniform int totalPoints;
uniform float z;

varying vec4 vertColor;
varying vec4 vertTexCoord;


float closestDistance(vec3 current){
	float dist = 2.0;
	for(int i=0; i<totalPoints; i++){
		vec3 point = points[i];
		float ndist = distance(current, point);
		if(ndist < dist){
			dist = ndist;
		}
	}
	return dist;
}

void main(void) {
	float dist = closestDistance(vec3(vertTexCoord.x, vertTexCoord.y, z));
	gl_FragColor = vec4(vec3(dist, dist, dist), 1.0);
}
