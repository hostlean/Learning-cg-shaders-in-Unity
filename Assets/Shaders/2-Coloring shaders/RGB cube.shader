// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/RGB cube" { 
   SubShader { 
      Pass { 
         CGPROGRAM 
 
         #pragma vertex vert // vert function is the vertex shader 
         #pragma fragment frag // frag function is the fragment shader
 
         void vert(float4 vertexPos : POSITION,
            out float4 pos : SV_POSITION,
            out float4 col : TEXCOORD0)  
         {
            pos =  UnityObjectToClipPos(vertexPos);
            col = vertexPos + float4(0.5, 0.5, 0.5, 0.0);
            return;
         }
 
         float4 frag(float4 pos : SV_POSITION, 
            float4 col : TEXCOORD0) : COLOR 
         {
            float4 rgb = float4(col.x, col.y, col.z, col.w);
            return rgb;
         }
 
         ENDCG 
      }
   }
}