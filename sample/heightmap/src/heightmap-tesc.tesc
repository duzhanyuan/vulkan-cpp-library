/*
 * Copyright 2016 Google Inc. All Rights Reserved.

 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at

 * http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#version 400
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

layout (vertices = 1) out;

layout (location = 0) in vec2 tesc_vertex[];

layout (location = 0) out vec2 tese_vertex[];

const int subdivisions = 8;

void main() {
   tese_vertex[gl_InvocationID] = tesc_vertex[gl_InvocationID];
   if (gl_InvocationID == 0) {
      for (int i = 0; i < 4; ++i) {
	     gl_TessLevelOuter[i] = subdivisions;
	  }
	  for (int i = 0; i < 2; ++i) {
	     gl_TessLevelInner[i] = subdivisions;
      }
   }
}
