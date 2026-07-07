-- 🚨 CRITICAL TRANSACTION ERROR: NAIVE RESERVATION LOOKUP
-- This allows multiple concurrent users to book the same room simultaneously.

-- Step 1: Check if room is free (User A and User B both read 'AVAILABLE' at the same time)
SELECT status FROM room_inventory 
WHERE room_id = 101 AND booking_date = '2026-08-15';

-- Step 2: Application logic checks the text and naively fires the update
-- ❌ Both users will successfully execute this, causing a Double-Booking disaster!
UPDATE room_inventory 
SET status = 'BOOKED', guest_id = 999 
WHERE room_id = 101 AND booking_date = '2026-08-15';
