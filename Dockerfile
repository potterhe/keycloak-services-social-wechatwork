FROM jboss/keycloak:15.0.2

USER root

RUN microdnf update -y && microdnf install -y procps net-tools && microdnf clean all

USER 1000

RUN set -eux; \
        \
        mkdir /opt/jboss/keycloak/providers

#https://www.kkzxak47.com/2019/07/30/%e4%bd%bf%e7%94%a8%e4%bc%81%e4%b8%9a%e5%be%ae%e4%bf%a1%e7%99%bb%e5%bd%95keycloak/
copy target/keycloak-services-social-wechat-work-15.0.2.jar /opt/jboss/keycloak/providers/
copy themes/base/admin/resources/partials/realm-identity-provider-wechat-work.html /opt/jboss/keycloak/themes/base/admin/resources/partials/
copy themes/base/admin/resources/partials/realm-identity-provider-wechat-work-ext.html /opt/jboss/keycloak/themes/base/admin/resources/partials/
copy themes/base/login/messages/messages_zh_CN.properties /opt/jboss/keycloak/themes/base/login/messages/messages_zh_CN.properties
copy module.xml /opt/jboss/keycloak/modules/system/layers/keycloak/org/keycloak/keycloak-services/main/module.xml
