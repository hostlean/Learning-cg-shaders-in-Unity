// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "HSV cylinder" { 
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
            
            float hue = 180.0+degrees(atan2(vertexPos.z, vertexPos.x));
            float saturation = (2.0 * sqrt(vertexPos.x * vertexPos.x + vertexPos.z * vertexPos.z));
            float val = (vertexPos.y + 1.0) / 2.0;

            float chroma = val * saturation;
            float h1 = hue / 60.0;
            float x = chroma * (1.0 - abs(h1 % 2.0f - 1.0));

            float3 rgb = float3(0,0,0);
            if(h1 > 0 && h1 < 1)
            {
                rgb = float3(chroma, x, 0.0f);
            }
            else if(h1 >= 1 && h1 < 2)
            {
                rgb = float3(x, chroma, 0.0f);
            }
            else if(h1 >= 2 && h1 < 3)
            {
                rgb = float3(0.0f, chroma, x);
            }
            else if(h1 >= 3 && h1 < 4)
            {
               rgb = float3(0.0f, x, chroma);
            }
            else if(h1 >= 4 && h1 < 5)
            {
                rgb = float3(x, 0.0f ,chroma);
            }
            else if(h1 >= 5 && h1 < 6)
            {
                rgb = float3(chroma, 0.0f, x);
            }

            float match = val - chroma;
            float3 newRgb = float3(rgb.x + match, rgb.y + match, rgb.z + match);

            col = float4(newRgb.x, newRgb.y, newRgb.z, match);
            
          
            
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