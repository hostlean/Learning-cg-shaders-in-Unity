Shader "Custom/False_color_shader" {
    SubShader {
        Pass{
        
        CGPROGRAM
        
            #pragma vertex vert  
            #pragma fragment frag 
            #include "UnityCG.cginc"
 
            struct vertexOutput {
                float4 pos : SV_POSITION;
                float4 col : TEXCOORD0;
            };
 
            vertexOutput vert(appdata_full input) 
            {
                vertexOutput output;
 
                output.pos = UnityObjectToClipPos(input.vertex);
                //output.col = input.texcoord;
                
                //red
                //output.col = float4(input.texcoord.x, 0.0, 0.0, 1.0);

                //green
                //output.col = float4(0.0, input.texcoord.y, 0.0, 1.0);

                 output.col = float4(
               (input.normal + float3(1.0, 1.0, 1.0)) / 2.0, 1.0);
                    
                
                return output;
            }
 
            float4 frag(vertexOutput input) : COLOR 
            {
                return input.col; 
            }
        
        ENDCG
        }
        
    }
}