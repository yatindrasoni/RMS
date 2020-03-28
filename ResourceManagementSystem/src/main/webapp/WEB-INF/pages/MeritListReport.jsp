<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.10.0.final using JasperReports Library version 6.10.0-unknown  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="Marit List" pageWidth="595" pageHeight="842" columnWidth="555" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="6a2de8fb-716a-42dc-9bdb-e82286d8aa57">
	<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="rms_database"/>
	<style name="Table_TH" mode="Opaque" backcolor="#F0F8FF">
		<box>
			<pen lineWidth="0.5" lineColor="#000000"/>
			<topPen lineWidth="0.5" lineColor="#000000"/>
			<leftPen lineWidth="0.5" lineColor="#000000"/>
			<bottomPen lineWidth="0.5" lineColor="#000000"/>
			<rightPen lineWidth="0.5" lineColor="#000000"/>
		</box>
	</style>
	<style name="Table_CH" mode="Opaque" backcolor="#BFE1FF">
		<box>
			<pen lineWidth="0.5" lineColor="#000000"/>
			<topPen lineWidth="0.5" lineColor="#000000"/>
			<leftPen lineWidth="0.5" lineColor="#000000"/>
			<bottomPen lineWidth="0.5" lineColor="#000000"/>
			<rightPen lineWidth="0.5" lineColor="#000000"/>
		</box>
	</style>
	<style name="Table_TD" mode="Opaque" backcolor="#FFFFFF">
		<box>
			<pen lineWidth="0.5" lineColor="#000000"/>
			<topPen lineWidth="0.5" lineColor="#000000"/>
			<leftPen lineWidth="0.5" lineColor="#000000"/>
			<bottomPen lineWidth="0.5" lineColor="#000000"/>
			<rightPen lineWidth="0.5" lineColor="#000000"/>
		</box>
	</style>
	<subDataset name="Dataset1" uuid="a9103d28-cd6e-4982-95b6-0f21dee25b21">
		<property name="com.jaspersoft.studio.data.sql.tables" value=""/>
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="rms_database"/>
		<queryString language="SQL">
			<![CDATA[SELECT `ID`,`ROLL_NO`, `NAME`, `PHYSICS`, `CHEMISTRY`, `MATHS` , (PHYSICS + CHEMISTRY + MATHS) as total from `MARKSHEET` order by total desc limit 0,10]]>
		</queryString>
		<field name="ID" class="java.lang.Long">
			<property name="com.jaspersoft.studio.field.label" value="ID"/>
			<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
		</field>
		<field name="ROLL_NO" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.label" value="ROLL_NO"/>
			<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
		</field>
		<field name="NAME" class="java.lang.String">
			<property name="com.jaspersoft.studio.field.label" value="NAME"/>
			<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
		</field>
		<field name="PHYSICS" class="java.lang.Integer">
			<property name="com.jaspersoft.studio.field.label" value="PHYSICS"/>
			<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
		</field>
		<field name="CHEMISTRY" class="java.lang.Integer">
			<property name="com.jaspersoft.studio.field.label" value="CHEMISTRY"/>
			<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
		</field>
		<field name="MATHS" class="java.lang.Integer">
			<property name="com.jaspersoft.studio.field.label" value="MATHS"/>
			<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
		</field>
		<field name="total" class="java.lang.Long">
			<property name="com.jaspersoft.studio.field.label" value="total"/>
		</field>
	</subDataset>
	<queryString language="SQL">
		<![CDATA[SELECT `ID`,`ROLL_NO`, `NAME`, `PHYSICS`, `CHEMISTRY`, `MATHS` , (PHYSICS + CHEMISTRY + MATHS) as total from `MARKSHEET` order by total desc limit 0,10]]>
	</queryString>
	<field name="ID" class="java.lang.Long">
		<property name="com.jaspersoft.studio.field.label" value="ID"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
	</field>
	<field name="ROLL_NO" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.label" value="ROLL_NO"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
	</field>
	<field name="NAME" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.label" value="NAME"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
	</field>
	<field name="PHYSICS" class="java.lang.Integer">
		<property name="com.jaspersoft.studio.field.label" value="PHYSICS"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
	</field>
	<field name="CHEMISTRY" class="java.lang.Integer">
		<property name="com.jaspersoft.studio.field.label" value="CHEMISTRY"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
	</field>
	<field name="MATHS" class="java.lang.Integer">
		<property name="com.jaspersoft.studio.field.label" value="MATHS"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="MARKSHEET"/>
	</field>
	<field name="total" class="java.lang.Long">
		<property name="com.jaspersoft.studio.field.label" value="total"/>
	</field>
	<background>
		<band splitType="Stretch"/>
	</background>
	<title>
		<band height="111" splitType="Stretch">
			<image>
				<reportElement x="231" y="20" width="93" height="91" uuid="e423aa6c-dc52-4543-b45e-409cb534f2a9"/>
				<imageExpression><![CDATA["/src/main/webapp/resource/images/report.png"]]></imageExpression>
			</image>
		</band>
	</title>
	<pageHeader>
		<band height="35" splitType="Stretch"/>
	</pageHeader>
	<columnHeader>
		<band height="219" splitType="Stretch">
			<componentElement>
				<reportElement x="0" y="30" width="550" height="100" uuid="86fcf200-3b9d-4d92-a631-33b880d2c8bb">
					<property name="com.jaspersoft.studio.layout" value="com.jaspersoft.studio.editor.layout.VerticalRowLayout"/>
					<property name="com.jaspersoft.studio.table.style.table_header" value="Table_TH"/>
					<property name="com.jaspersoft.studio.table.style.column_header" value="Table_CH"/>
					<property name="com.jaspersoft.studio.table.style.detail" value="Table_TD"/>
				</reportElement>
				<jr:table xmlns:jr="http://jasperreports.sourceforge.net/jasperreports/components" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports/components http://jasperreports.sourceforge.net/xsd/components.xsd">
					<datasetRun subDataset="Dataset1" uuid="28394589-4618-4ed5-b819-9c5c690d5e4d">
						<connectionExpression><![CDATA[$P{REPORT_CONNECTION}]]></connectionExpression>
					</datasetRun>
					<jr:column width="100" uuid="8640acd2-4025-4e73-84e6-1459e3b515b9">
						<property name="com.jaspersoft.studio.components.table.model.column.name" value="Column1"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="100" height="30" uuid="92a66d01-34f9-4d91-8ba3-a1ab4c15c55c"/>
								<textElement>
									<font size="14"/>
								</textElement>
								<text><![CDATA[ROLL_NO]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement x="0" y="0" width="100" height="30" uuid="e6d1c2e6-49cc-45e1-921a-df58fe8b9a62"/>
								<textElement>
									<font size="12"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{ROLL_NO}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="80" uuid="02353a9a-3451-451d-b150-0ede1cbf7f1b">
						<property name="com.jaspersoft.studio.components.table.model.column.name" value="Column2"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="80" height="30" uuid="2f262454-1062-466f-b315-1f93bd42243b"/>
								<textElement>
									<font size="14"/>
								</textElement>
								<text><![CDATA[NAME]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement x="0" y="0" width="80" height="30" uuid="2fea2c74-fe3e-4ced-ba81-40af56b3a29d"/>
								<textElement>
									<font size="12"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{NAME}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="100" uuid="2b8f66be-c3dc-4a78-99e2-36ca70b634f8">
						<property name="com.jaspersoft.studio.components.table.model.column.name" value="Column3"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="100" height="30" uuid="b8584286-41f4-4757-bd34-f3ae29f5c185"/>
								<textElement>
									<font size="14"/>
								</textElement>
								<text><![CDATA[PHYSICS]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement x="0" y="0" width="100" height="30" uuid="071d6f77-63c4-429a-a117-e5a389aad17a"/>
								<textElement>
									<font size="12"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{PHYSICS}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="110" uuid="08e60d69-40fc-42a4-b593-ab6b94723265">
						<property name="com.jaspersoft.studio.components.table.model.column.name" value="Column4"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="110" height="30" uuid="100f7998-fff5-401c-b034-7a80a9d4087f"/>
								<textElement>
									<font size="14"/>
								</textElement>
								<text><![CDATA[CHEMISTRY]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement x="0" y="0" width="110" height="30" uuid="bc38aff2-fcd4-41d8-98f2-0e9e763f1b68"/>
								<textElement>
									<font size="12"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{CHEMISTRY}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="80" uuid="c18566e7-1740-437b-844e-747f4fda0c9c">
						<property name="com.jaspersoft.studio.components.table.model.column.name" value="Column5"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="80" height="30" uuid="5f44af54-aa76-4429-8fc7-d288c6477291"/>
								<textElement>
									<font size="14"/>
								</textElement>
								<text><![CDATA[MATHS]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement x="0" y="0" width="80" height="30" uuid="64e10765-63bb-4cc4-89ad-46820485fda6"/>
								<textElement>
									<font size="12"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{MATHS}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="80" uuid="b941da9c-697b-4823-834f-de0a5c3e3af4">
						<property name="com.jaspersoft.studio.components.table.model.column.name" value="Column6"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="80" height="30" uuid="33278e1c-a35a-4632-98d2-d0e8c5c3d908"/>
								<textElement>
									<font size="14"/>
								</textElement>
								<text><![CDATA[total]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement x="0" y="0" width="80" height="30" uuid="34c4e704-faaf-464d-aca2-91de11e896fc"/>
								<textElement>
									<font size="12"/>
								</textElement>
								<textFieldExpression><![CDATA[$F{total}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
				</jr:table>
			</componentElement>
			<staticText>
				<reportElement x="0" y="-35" width="550" height="65" uuid="f7fc0671-bead-490c-b126-46c6bbeac774"/>
				<textElement textAlignment="Center">
					<font size="26"/>
				</textElement>
				<text><![CDATA[Marit List]]></text>
			</staticText>
		</band>
	</columnHeader>
	<detail>
		<band height="125" splitType="Stretch"/>
	</detail>
	<columnFooter>
		<band height="45" splitType="Stretch"/>
	</columnFooter>
	<pageFooter>
		<band height="54" splitType="Stretch"/>
	</pageFooter>
	<summary>
		<band height="42" splitType="Stretch"/>
	</summary>
</jasperReport>
