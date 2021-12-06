-- لتفادي الأخطاء الرجاء إضافة الاستعلامات كلٌ على حده
--
-- Database: `flysaveairline`
--

-- --------------------------------------------------------

--
-- بنية الجدول `flight`
--

CREATE TABLE `flight` (
  `FlightNo` int(3) NOT NULL,
  `FlightType` varchar(15) NOT NULL DEFAULT 'Boeing 777',
  `FromCity` varchar(15) NOT NULL,
  `ToCity` varchar(15) NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `Flight_date` date DEFAULT NULL,
  `price` double DEFAULT 5000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `flight`
--

INSERT INTO `flight` (`FlightNo`, `FlightType`, `FromCity`, `ToCity`, `DepartureTime`, `ArrivalTime`, `Flight_date`, `price`) VALUES
(201, 'Boeing 777', 'Qassim', 'Riyadh', '09:00:00', '11:00:00', '2021-12-15', 2000),
(202, 'Boeing 777', 'Qassim', 'jeddah', '09:00:00', '11:00:00', '2021-12-15', 2000),
(204, 'Boeing 777', 'Qassim', 'jeddah', '15:00:00', '17:00:00', '2021-12-16', 3000),
(205, 'Boeing 777', 'Qassim', 'jeddah', '09:00:00', '11:00:00', '2021-12-17', 3000),
(207, 'Boeing 777', 'Jeddah', 'Riyadh', '16:00:00', '18:00:00', '2021-12-15', 5000),
(208, 'Boeing 777', 'Jeddah', 'Riyadh', '09:00:00', '11:00:00', '2021-12-16', 5000),
(211, 'Boeing 777', 'Jeddah', 'Riyadh', '16:00:00', '18:00:00', '2021-12-17', 5000),
(212, 'Boeing 777', 'Riyadh', 'Dubai', '11:00:00', '14:00:00', '2021-12-15', 7000),
(214, 'Boeing 777', 'Riyadh', 'Dubai', '11:00:00', '14:00:00', '2021-12-16', 7000),
(217, 'Boeing 777', 'Riyadh', 'Dubai', '18:00:00', '22:00:00', '2021-12-17', 7000);

-- --------------------------------------------------------

--
-- بنية الجدول `reservation`
--

CREATE TABLE `reservation` (
  `Reservation_num` int(5) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `NmberOfAdults` int(10) NOT NULL,
  `NumberOfChildren` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `reservation`
--

INSERT INTO `reservation` (`Reservation_num`, `Username`, `NmberOfAdults`, `NumberOfChildren`) VALUES
(4050, 'imuser', 2, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `res_tic`
--

CREATE TABLE `res_tic` (
  `Reservation_num` int(5) NOT NULL,
  `TicketNo` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `res_tic`
--

INSERT INTO `res_tic` (`Reservation_num`, `TicketNo`) VALUES
(4050, 2001),
(4050, 2002);

-- --------------------------------------------------------

--
-- بنية الجدول `ticket`
--

CREATE TABLE `ticket` (
  `TicketNo` int(4) NOT NULL,
  `TravelerID` int(5) NOT NULL,
  `Flight_ID` int(3) NOT NULL,
  `Ticket_Type` varchar(10) NOT NULL DEFAULT 'Economy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `ticket`
--

INSERT INTO `ticket` (`TicketNo`, `TravelerID`, `Flight_ID`, `Ticket_Type`) VALUES
(2001, 11, 204, 'Economy'),
(2002, 14, 204, 'Economy');

-- --------------------------------------------------------

--
-- بنية الجدول `traveler`
--

CREATE TABLE `traveler` (
  `TravelerID` int(5) NOT NULL,
  `National_ID` int(10) NOT NULL,
  `Gender` varchar(5) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNum` varchar(50) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `traveler`
--

INSERT INTO `traveler` (`TravelerID`, `National_ID`, `Gender`, `FirstName`, `LastName`, `DOB`, `Email`, `PhoneNum`) VALUES
(11, 100200300, 'Mr', 'Ahmed', 'omar', '1995-02-11', '', '0500300300'),
(14, 100200301, 'Miss', 'Norah', 'Ahmed', '2010-05-01', '', '0555000050');

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `Usersname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`Usersname`, `Email`, `Password1`) VALUES
('imuser', 'imuser@user.com', 'imuser');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`FlightNo`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_num`),
  ADD KEY `Reservation_fk1` (`Username`);
  
  
--
-- Indexes for table `res_tic`
--
ALTER TABLE `res_tic`
  ADD KEY `Res_Tic_fk0` (`Reservation_num`),
  ADD KEY `Res_Tic_fk1` (`TicketNo`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TicketNo`),
  ADD KEY `Ticket_fk0` (`TravelerID`),
  ADD KEY `Ticket_fk1` (`Flight_ID`);

--
-- Indexes for table `traveler`
--
ALTER TABLE `traveler`
  ADD PRIMARY KEY (`TravelerID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Usersname`),
  ADD UNIQUE KEY `Usersname` (`Usersname`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `FlightNo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Reservation_num` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4051;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `TicketNo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2003;

--
-- AUTO_INCREMENT for table `traveler`
--
ALTER TABLE `traveler`
  MODIFY `TravelerID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `Reservation_fk1` FOREIGN KEY (`Username`) REFERENCES `users` (`Usersname`);

--
-- القيود للجدول `res_tic`
--
ALTER TABLE `res_tic`
  ADD CONSTRAINT `Res_Tic_fk0` FOREIGN KEY (`Reservation_num`) REFERENCES `reservation` (`Reservation_num`),
  ADD CONSTRAINT `Res_Tic_fk1` FOREIGN KEY (`TicketNo`) REFERENCES `ticket` (`TicketNo`);
  
--
-- القيود للجدول `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `Ticket_fk0` FOREIGN KEY (`TravelerID`) REFERENCES `traveler` (`TravelerID`),
  ADD CONSTRAINT `Ticket_fk1` FOREIGN KEY (`Flight_ID`) REFERENCES `flight` (`FlightNo`);

COMMIT;
