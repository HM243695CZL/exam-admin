package com.hl.yyx.config;

import com.hl.yyx.common.config.BaseSwaggerConfig;
import com.hl.yyx.common.domain.SwaggerProperties;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger API文档相关配置
 * Created by macro on 2018/4/26.
 */
@Configuration
@EnableSwagger2
@ConditionalOnProperty(name = "swagger.enable", havingValue = "true")
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.hl.yyx.modules")
                .title("考试管理系统")
                .description("考试管理系统")
                .contactName("yyx")
                .version("1.0")
                .enableSecurity(true)
                .build();
    }
}
