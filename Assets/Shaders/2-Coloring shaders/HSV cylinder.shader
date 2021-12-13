// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/HSV cylinder" { 
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

            const float hue = 179.99f+degrees(atan2(vertexPos.z, vertexPos.x));
            const float saturation = (2.0f * sqrt(vertexPos.x * vertexPos.x + vertexPos.z * vertexPos.z));
            const float val = (vertexPos.y + 1.0f) / 2.0f;

            float chroma = val * saturation;
            const float h1 = hue / 60.0f;
            float x = chroma * (1.0f - abs(h1 % 2.0f - 1.0f));

            float3 rgb = float3(0.0f ,0.0f ,0.0f);
            
            if(h1 >= 0.0f && h1 < 1.0f)
            {
                rgb = float3(chroma, x, 0.0f);
            }
            else if(h1 >= 1.0f && h1 < 2.0f)
            {
                rgb = float3(x, chroma, 0.0f);
            }
            else if(h1 >= 2.0f && h1 < 3.0f)
            {
                rgb = float3(0.0f, chroma, x);
            }
            else if(h1 >= 3.0f && h1 < 4.0f)
            {
               rgb = float3(0.0f, x, chroma);
            }
            else if(h1 >= 4.0f && h1 < 5.0f)
            {
                rgb = float3(x, 0.0f ,chroma);
            }
            else if(h1 >= 5.0f && h1 <= 6.0f)
            {
                rgb = float3(chroma, 0.0f, x);
            }

            float match = val - chroma;
            float3 newRgb = float3(rgb.x + match, rgb.y + match, rgb.z + match);

            col = float4(newRgb.x, newRgb.y, newRgb.z, 0);
            
          
            
         }
 
         float4 frag(float4 pos : SV_POSITION, 
            float4 col : TEXCOORD0) : COLOR 
         {
            
            return col;
         }
 
         ENDCG 
      }
   }
}