<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/OWASPZAPReport">
		<testsuite
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:noNamespaceSchemaLocation="https://maven.apache.org/surefire/maven-surefire-plugin/xsd/surefire-test-report.xsd">

			<xsl:attribute name="name">
				<xsl:value-of select="site/@name"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="tests">
				<xsl:value-of select="count(site/alerts/alertitem)"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="failures">
				<xsl:value-of select="count(site/alerts/alertitem)"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="errors">
				<xsl:value-of select="0"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="skipped">
				<xsl:value-of select="0"></xsl:value-of>
			</xsl:attribute>


			<properties>
				<property name="name">
					<xsl:attribute name="value">
						<xsl:value-of select="site/@name"></xsl:value-of>
					</xsl:attribute>
				</property>
				<property name="host">
					<xsl:attribute name="value">
						<xsl:value-of select="site/@host"></xsl:value-of>
					</xsl:attribute>
				</property>
				<property name="port">
					<xsl:attribute name="value">
						<xsl:value-of select="site/@port"></xsl:value-of>
					</xsl:attribute>
				</property>
				<property name="ssl">
					<xsl:attribute name="value">
						<xsl:value-of select="site/@ssl"></xsl:value-of>
					</xsl:attribute>
				</property>
				<property name="version">
					<xsl:attribute name="value">
						<xsl:value-of select="@version"></xsl:value-of>
					</xsl:attribute>
				</property>
				<property name="generated">
					<xsl:attribute name="value">
						<xsl:value-of select="@generated"></xsl:value-of>
					</xsl:attribute>
				</property>
			</properties>

			<xsl:for-each select="site/alerts/alertitem">
				<testcase time="0.0">
					<xsl:attribute name="name">
						<xsl:value-of select="name"></xsl:value-of>
					</xsl:attribute>

					<failure>
						<xsl:attribute name="type">
							<xsl:value-of select="riskdesc"></xsl:value-of>
						</xsl:attribute>
						
						<xsl:variable name="urls">
							<xsl:for-each select="instances/instance">
								<xsl:value-of select="concat( method, ' - ',uri, '; ')" />
							</xsl:for-each>
						</xsl:variable>
						
						<xsl:attribute name="message">
							<xsl:value-of select="concat('AlertRef - ', alertRef,'. Message - ',desc, '. Solution - ', solution, '. URLs - ', $urls)"></xsl:value-of>
						</xsl:attribute>
						
					</failure>
				</testcase>
			</xsl:for-each>
		</testsuite>
	</xsl:template>
</xsl:stylesheet>