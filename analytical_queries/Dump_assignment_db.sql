-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment_db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `financial_data_adjustments_to_reconcile_net_in_8651eb1c`
--

DROP TABLE IF EXISTS `financial_data_adjustments_to_reconcile_net_in_8651eb1c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_adjustments_to_reconcile_net_in_8651eb1c` (
  `index` varchar(255) DEFAULT NULL,
  `Depreciation_and_amortization` varchar(255) DEFAULT NULL,
  `Amortization_of_deferred_financing_costs` varchar(255) DEFAULT NULL,
  `Provision_for_inventory_obsolescence` varchar(255) DEFAULT NULL,
  `Provision_for_bad_debts` varchar(255) DEFAULT NULL,
  `Deferred_income_taxes` varchar(255) DEFAULT NULL,
  `Remeasurement_of_tax_receivable_83e393ef` varchar(255) DEFAULT NULL,
  `Gain_on_sale_of_center` varchar(255) DEFAULT NULL,
  `Loss_on_disposal_of_property_an_2a930446` varchar(255) DEFAULT NULL,
  `Equity_compensation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_adjustments_to_reconcile_net_in_8651eb1c`
--

LOCK TABLES `financial_data_adjustments_to_reconcile_net_in_8651eb1c` WRITE;
/*!40000 ALTER TABLE `financial_data_adjustments_to_reconcile_net_in_8651eb1c` DISABLE KEYS */;
INSERT INTO `financial_data_adjustments_to_reconcile_net_in_8651eb1c` VALUES ('For_the_TwentySix_Weeks_Ended_July_5_2025','$9984','$2947','—','$75','$3200','$20','—','—','$4943'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$10174','$2773','$(70)','$113','$2751','$249','$(81)','$3','$3323');
/*!40000 ALTER TABLE `financial_data_adjustments_to_reconcile_net_in_8651eb1c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_assets`
--

DROP TABLE IF EXISTS `financial_data_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_assets` (
  `index` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_assets`
--

LOCK TABLES `financial_data_assets` WRITE;
/*!40000 ALTER TABLE `financial_data_assets` DISABLE KEYS */;
INSERT INTO `financial_data_assets` VALUES ('June_30_2025_unaudited'),('December_31_2024');
/*!40000 ALTER TABLE `financial_data_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_basic_and_diluted_loss_per_share`
--

DROP TABLE IF EXISTS `financial_data_basic_and_diluted_loss_per_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_basic_and_diluted_loss_per_share` (
  `index` varchar(255) DEFAULT NULL,
  `Loss_from_continuing_operations` varchar(255) DEFAULT NULL,
  `Gain_loss_from_discontinued_operations` varchar(255) DEFAULT NULL,
  `Basic_and_diluted_loss_per_share` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_basic_and_diluted_loss_per_share`
--

LOCK TABLES `financial_data_basic_and_diluted_loss_per_share` WRITE;
/*!40000 ALTER TABLE `financial_data_basic_and_diluted_loss_per_share` DISABLE KEYS */;
INSERT INTO `financial_data_basic_and_diluted_loss_per_share` VALUES ('Three_Months_Ended_June_30_2025','$(0.30)','$0.01','$(0.29)'),('Six_Months_Ended_June_30_2025','$(0.55)','$0.01','$(0.54)'),('Six_Months_Ended_June_30_2024','$(0.40)','$(0.01)','$(0.41)');
/*!40000 ALTER TABLE `financial_data_basic_and_diluted_loss_per_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_cash_flows_from_financing_activities`
--

DROP TABLE IF EXISTS `financial_data_cash_flows_from_financing_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_cash_flows_from_financing_activities` (
  `index` varchar(255) DEFAULT NULL,
  `Principal_payments_on_longterm_debt` varchar(255) DEFAULT NULL,
  `Distributions_to_EWC_Ventures_L_58686ea2` varchar(255) DEFAULT NULL,
  `Repurchase_of_Class_A_common_stock` varchar(255) DEFAULT NULL,
  `Taxes_on_vested_restricted_stoc_da41405d` varchar(255) DEFAULT NULL,
  `Dividend_equivalents_to_holders_3e2df3a0` varchar(255) DEFAULT NULL,
  `Payments_pursuant_to_tax_receiv_0bca18d1` varchar(255) DEFAULT NULL,
  `Net_cash_used_in_financing_activities` varchar(255) DEFAULT NULL,
  `Net_increase_in_cash_cash_equiv_b6235c05` varchar(255) DEFAULT NULL,
  `Cash_cash_equivalents_and_restr_1ee5d68a` varchar(255) DEFAULT NULL,
  `Cash_cash_equivalents_and_restr_d7276d38` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_cash_flows_from_financing_activities`
--

LOCK TABLES `financial_data_cash_flows_from_financing_activities` WRITE;
/*!40000 ALTER TABLE `financial_data_cash_flows_from_financing_activities` DISABLE KEYS */;
INSERT INTO `financial_data_cash_flows_from_financing_activities` VALUES ('For_the_TwentySix_Weeks_Ended_July_5_2025','$(2,000)','$(2,243)','$(1,447)','$(161)','$(10)','$(6,544)','$(12,405)','$14136','$56194','$70330'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$(2,000)','$(2,515)','$(10,001)','$(393)','$(725)','$(6,496)','$(22,130)','$2921','$59228','$62149');
/*!40000 ALTER TABLE `financial_data_cash_flows_from_financing_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_cash_flows_from_investing_activities`
--

DROP TABLE IF EXISTS `financial_data_cash_flows_from_investing_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_cash_flows_from_investing_activities` (
  `index` varchar(255) DEFAULT NULL,
  `Purchases_of_property_and_equipment` varchar(255) DEFAULT NULL,
  `Cash_received_for_sale_of_center` varchar(255) DEFAULT NULL,
  `Net_cash_used_in_investing_activities` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_cash_flows_from_investing_activities`
--

LOCK TABLES `financial_data_cash_flows_from_investing_activities` WRITE;
/*!40000 ALTER TABLE `financial_data_cash_flows_from_investing_activities` DISABLE KEYS */;
INSERT INTO `financial_data_cash_flows_from_investing_activities` VALUES ('For_the_TwentySix_Weeks_Ended_July_5_2025','$(1,363)','—','$(1,363)'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$(215)','$135','$(80)');
/*!40000 ALTER TABLE `financial_data_cash_flows_from_investing_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_cash_flows_from_operating_activities`
--

DROP TABLE IF EXISTS `financial_data_cash_flows_from_operating_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_cash_flows_from_operating_activities` (
  `index` varchar(255) DEFAULT NULL,
  `Net_income` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_cash_flows_from_operating_activities`
--

LOCK TABLES `financial_data_cash_flows_from_operating_activities` WRITE;
/*!40000 ALTER TABLE `financial_data_cash_flows_from_operating_activities` DISABLE KEYS */;
INSERT INTO `financial_data_cash_flows_from_operating_activities` VALUES ('For_the_TwentySix_Weeks_Ended_July_5_2025','$7963'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$9578');
/*!40000 ALTER TABLE `financial_data_cash_flows_from_operating_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_changes_in_assets_and_liabilities`
--

DROP TABLE IF EXISTS `financial_data_changes_in_assets_and_liabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_changes_in_assets_and_liabilities` (
  `index` varchar(255) DEFAULT NULL,
  `Accounts_receivable` varchar(255) DEFAULT NULL,
  `Inventory_net` varchar(255) DEFAULT NULL,
  `Prepaid_expenses_and_other_assets` varchar(255) DEFAULT NULL,
  `Accounts_payable_and_accrued_liabilities` varchar(255) DEFAULT NULL,
  `Deferred_revenue` varchar(255) DEFAULT NULL,
  `Other_longterm_liabilities` varchar(255) DEFAULT NULL,
  `Net_cash_provided_by_operating__e1a527a0` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_changes_in_assets_and_liabilities`
--

LOCK TABLES `financial_data_changes_in_assets_and_liabilities` WRITE;
/*!40000 ALTER TABLE `financial_data_changes_in_assets_and_liabilities` DISABLE KEYS */;
INSERT INTO `financial_data_changes_in_assets_and_liabilities` VALUES ('For_the_TwentySix_Weeks_Ended_July_5_2025','$(1,455)','$2','$570','$887','$(576)','$(656)','$27904'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$(964)','$(1,246)','$948','$(835)','$(1,044)','$(541)','$25131');
/*!40000 ALTER TABLE `financial_data_changes_in_assets_and_liabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_commitments_and_contingencies`
--

DROP TABLE IF EXISTS `financial_data_commitments_and_contingencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_commitments_and_contingencies` (
  `index` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_commitments_and_contingencies`
--

LOCK TABLES `financial_data_commitments_and_contingencies` WRITE;
/*!40000 ALTER TABLE `financial_data_commitments_and_contingencies` DISABLE KEYS */;
INSERT INTO `financial_data_commitments_and_contingencies` VALUES ('June_30_2025_unaudited'),('December_31_2024');
/*!40000 ALTER TABLE `financial_data_commitments_and_contingencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_current_assets`
--

DROP TABLE IF EXISTS `financial_data_current_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_current_assets` (
  `index` varchar(255) DEFAULT NULL,
  `Cash_and_cash_equivalents` varchar(255) DEFAULT NULL,
  `Shortterm_investments` varchar(255) DEFAULT NULL,
  `Accounts_receivable_net_of_allo_26f3c7d5` varchar(255) DEFAULT NULL,
  `Prepaid_expenses_and_other_curr_bc90730e` varchar(255) DEFAULT NULL,
  `Total_current_assets` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_current_assets`
--

LOCK TABLES `financial_data_current_assets` WRITE;
/*!40000 ALTER TABLE `financial_data_current_assets` DISABLE KEYS */;
INSERT INTO `financial_data_current_assets` VALUES ('June_30_2025_unaudited','$28849','$162729','$225','$4155','$195958'),('December_31_2024','$61580','$165336','$116','$4128','$231160');
/*!40000 ALTER TABLE `financial_data_current_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_current_liabilities`
--

DROP TABLE IF EXISTS `financial_data_current_liabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_current_liabilities` (
  `index` varchar(255) DEFAULT NULL,
  `Accounts_payable_and_accrued_expenses` varchar(255) DEFAULT NULL,
  `Lease_liability` varchar(255) DEFAULT NULL,
  `Accrued_personnel_expenses` varchar(255) DEFAULT NULL,
  `Note_payable` varchar(255) DEFAULT NULL,
  `Deferred_Income` varchar(255) DEFAULT NULL,
  `Total_current_liabilities` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_current_liabilities`
--

LOCK TABLES `financial_data_current_liabilities` WRITE;
/*!40000 ALTER TABLE `financial_data_current_liabilities` DISABLE KEYS */;
INSERT INTO `financial_data_current_liabilities` VALUES ('June_30_2025_unaudited','$7048','$847','$5037','$54','-','$12986'),('December_31_2024','$10343','$957','$5478','$52','$1400','$18230');
/*!40000 ALTER TABLE `financial_data_current_liabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_label`
--

DROP TABLE IF EXISTS `financial_data_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_label` (
  `index` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_label`
--

LOCK TABLES `financial_data_label` WRITE;
/*!40000 ALTER TABLE `financial_data_label` DISABLE KEYS */;
INSERT INTO `financial_data_label` VALUES ('Three_Months_Ended_June_30_2025'),('Six_Months_Ended_June_30_2025'),('Six_Months_Ended_June_30_2024');
/*!40000 ALTER TABLE `financial_data_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_liabilities_and_stockholders_equity`
--

DROP TABLE IF EXISTS `financial_data_liabilities_and_stockholders_equity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_liabilities_and_stockholders_equity` (
  `index` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_liabilities_and_stockholders_equity`
--

LOCK TABLES `financial_data_liabilities_and_stockholders_equity` WRITE;
/*!40000 ALTER TABLE `financial_data_liabilities_and_stockholders_equity` DISABLE KEYS */;
INSERT INTO `financial_data_liabilities_and_stockholders_equity` VALUES ('June_30_2025_unaudited'),('December_31_2024');
/*!40000 ALTER TABLE `financial_data_liabilities_and_stockholders_equity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_net_income_per_share`
--

DROP TABLE IF EXISTS `financial_data_net_income_per_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_net_income_per_share` (
  `index` varchar(255) DEFAULT NULL,
  `Basic__Class_A_Common_Stock` varchar(255) DEFAULT NULL,
  `Diluted__Class_A_Common_Stock` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_net_income_per_share`
--

LOCK TABLES `financial_data_net_income_per_share` WRITE;
/*!40000 ALTER TABLE `financial_data_net_income_per_share` DISABLE KEYS */;
INSERT INTO `financial_data_net_income_per_share` VALUES ('For_the_Thirteen_Weeks_Ended_July_5_2025','$0.09','$0.09'),('For_the_TwentySix_Weeks_Ended_July_5_2025','$0.13','$0.13'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$0.15','$0.15');
/*!40000 ALTER TABLE `financial_data_net_income_per_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_noncurrent_assets`
--

DROP TABLE IF EXISTS `financial_data_noncurrent_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_noncurrent_assets` (
  `index` varchar(255) DEFAULT NULL,
  `Property_and_equipment_net` varchar(255) DEFAULT NULL,
  `Rightofuse_asset_net` varchar(255) DEFAULT NULL,
  `Intangible_assets_inprocess_res_0a8d77e8` varchar(255) DEFAULT NULL,
  `Other_assets_net` varchar(255) DEFAULT NULL,
  `Total_assets` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_noncurrent_assets`
--

LOCK TABLES `financial_data_noncurrent_assets` WRITE;
/*!40000 ALTER TABLE `financial_data_noncurrent_assets` DISABLE KEYS */;
INSERT INTO `financial_data_noncurrent_assets` VALUES ('June_30_2025_unaudited','$62599','$1767','$50000','$401','$310725'),('December_31_2024','$57321','$2215','$50000','$405','$341101');
/*!40000 ALTER TABLE `financial_data_noncurrent_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_noncurrent_liabilities`
--

DROP TABLE IF EXISTS `financial_data_noncurrent_liabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_noncurrent_liabilities` (
  `index` varchar(255) DEFAULT NULL,
  `Lease_liability_net_of_current_portion` varchar(255) DEFAULT NULL,
  `Note_payable_net_of_current_portion` varchar(255) DEFAULT NULL,
  `Deferred_Income_net_of_current_portion` varchar(255) DEFAULT NULL,
  `Deferred_tax_liability` varchar(255) DEFAULT NULL,
  `Other_noncurrent_liabilities` varchar(255) DEFAULT NULL,
  `Total_liabilities` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_noncurrent_liabilities`
--

LOCK TABLES `financial_data_noncurrent_liabilities` WRITE;
/*!40000 ALTER TABLE `financial_data_noncurrent_liabilities` DISABLE KEYS */;
INSERT INTO `financial_data_noncurrent_liabilities` VALUES ('June_30_2025_unaudited','$1071','$1597','$26600','$2495','$284','$45033'),('December_31_2024','$1428','$1625','$26600','$2495','$55','$50433');
/*!40000 ALTER TABLE `financial_data_noncurrent_liabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_nonoperating_income_expense`
--

DROP TABLE IF EXISTS `financial_data_nonoperating_income_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_nonoperating_income_expense` (
  `index` varchar(255) DEFAULT NULL,
  `Interest_income` varchar(255) DEFAULT NULL,
  `Interest_and_other_expense` varchar(255) DEFAULT NULL,
  `Other_income_from_a_related_party` varchar(255) DEFAULT NULL,
  `Equity_in_loss_of_affiliate` varchar(255) DEFAULT NULL,
  `Total_nonoperating_income_net` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_nonoperating_income_expense`
--

LOCK TABLES `financial_data_nonoperating_income_expense` WRITE;
/*!40000 ALTER TABLE `financial_data_nonoperating_income_expense` DISABLE KEYS */;
INSERT INTO `financial_data_nonoperating_income_expense` VALUES ('Three_Months_Ended_June_30_2025','$2159','$(119)','-','-','$2040'),('Six_Months_Ended_June_30_2025','$4543','$(247)','$1400','$(1)','$5695'),('Six_Months_Ended_June_30_2024','$4287','$(52)','-','$(6)','$4229');
/*!40000 ALTER TABLE `financial_data_nonoperating_income_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_operating_expenses`
--

DROP TABLE IF EXISTS `financial_data_operating_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_operating_expenses` (
  `index` varchar(255) DEFAULT NULL,
  `Research_and_development` varchar(255) DEFAULT NULL,
  `General_and_administrative` varchar(255) DEFAULT NULL,
  `Total_operating_expenses` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_operating_expenses`
--

LOCK TABLES `financial_data_operating_expenses` WRITE;
/*!40000 ALTER TABLE `financial_data_operating_expenses` DISABLE KEYS */;
INSERT INTO `financial_data_operating_expenses` VALUES ('Three_Months_Ended_June_30_2025','$16620','$7709','$24329'),('Six_Months_Ended_June_30_2025','$30952','$15551','$46503'),('Six_Months_Ended_June_30_2024','$16727','$11392','$28119');
/*!40000 ALTER TABLE `financial_data_operating_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_revenue`
--

DROP TABLE IF EXISTS `financial_data_revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_revenue` (
  `index` varchar(255) DEFAULT NULL,
  `Product_sales` varchar(255) DEFAULT NULL,
  `Royalty_fees` varchar(255) DEFAULT NULL,
  `Marketing_fees` varchar(255) DEFAULT NULL,
  `Other_revenue` varchar(255) DEFAULT NULL,
  `Total_revenue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_revenue`
--

LOCK TABLES `financial_data_revenue` WRITE;
/*!40000 ALTER TABLE `financial_data_revenue` DISABLE KEYS */;
INSERT INTO `financial_data_revenue` VALUES ('For_the_Thirteen_Weeks_Ended_July_5_2025','$30515','$14278','$8108','$3010','$55911'),('For_the_TwentySix_Weeks_Ended_July_5_2025','$59386','$26706','$15311','$5935','$107338'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$63421','$26901','$15238','$6185','$111745');
/*!40000 ALTER TABLE `financial_data_revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_stockholders_equity`
--

DROP TABLE IF EXISTS `financial_data_stockholders_equity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_stockholders_equity` (
  `index` varchar(255) DEFAULT NULL,
  `Preferred_stock_0001_par_value__9c05b50b` varchar(255) DEFAULT NULL,
  `Common_stock_0001_par_value_aut_1b5aff29` varchar(255) DEFAULT NULL,
  `Additional_paidin_capital` varchar(255) DEFAULT NULL,
  `Accumulated_other_comprehensive_279f12cf` varchar(255) DEFAULT NULL,
  `Accumulated_deficit` varchar(255) DEFAULT NULL,
  `Total_stockholders_equity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_stockholders_equity`
--

LOCK TABLES `financial_data_stockholders_equity` WRITE;
/*!40000 ALTER TABLE `financial_data_stockholders_equity` DISABLE KEYS */;
INSERT INTO `financial_data_stockholders_equity` VALUES ('June_30_2025_unaudited','-','$74','$536996','$3','$(271,381)','$265692'),('December_31_2024','-','$70','$522368','$(51)','$(231,719)','$290668');
/*!40000 ALTER TABLE `financial_data_stockholders_equity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_supplemental_cash_flow_information`
--

DROP TABLE IF EXISTS `financial_data_supplemental_cash_flow_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_supplemental_cash_flow_information` (
  `index` varchar(255) DEFAULT NULL,
  `Cash_paid_for_interest` varchar(255) DEFAULT NULL,
  `Cash_paid_for_income_taxes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_supplemental_cash_flow_information`
--

LOCK TABLES `financial_data_supplemental_cash_flow_information` WRITE;
/*!40000 ALTER TABLE `financial_data_supplemental_cash_flow_information` DISABLE KEYS */;
INSERT INTO `financial_data_supplemental_cash_flow_information` VALUES ('For_the_TwentySix_Weeks_Ended_July_5_2025','$10863','$440'),('For_the_TwentySix_Weeks_Ended_July_6_2024','$10976','$444');
/*!40000 ALTER TABLE `financial_data_supplemental_cash_flow_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_data_weighted_average_shares_used_in_b187a76b`
--

DROP TABLE IF EXISTS `financial_data_weighted_average_shares_used_in_b187a76b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_data_weighted_average_shares_used_in_b187a76b` (
  `index` varchar(255) DEFAULT NULL,
  `Basic_and_diluted` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_data_weighted_average_shares_used_in_b187a76b`
--

LOCK TABLES `financial_data_weighted_average_shares_used_in_b187a76b` WRITE;
/*!40000 ALTER TABLE `financial_data_weighted_average_shares_used_in_b187a76b` DISABLE KEYS */;
INSERT INTO `financial_data_weighted_average_shares_used_in_b187a76b` VALUES ('Three_Months_Ended_June_30_2025','$74235'),('Six_Months_Ended_June_30_2025','$73301'),('Six_Months_Ended_June_30_2024','$58079');
/*!40000 ALTER TABLE `financial_data_weighted_average_shares_used_in_b187a76b` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-19  8:47:48
