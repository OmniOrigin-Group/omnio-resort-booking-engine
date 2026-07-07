-- 🚀 OMNIORIGIN ATOMIC TRANSACTIONAL RESERVATION ENGINE
-- Strategy: Pessimistic Row-Level Locking via 'FOR UPDATE'
-- Result: Absolute protection against race conditions and multi-booking bugs.

BEGIN;

-- Step 1: Instantly lock this exact row. 
-- Any other concurrent request trying to read or write to Room 101 for this date 
-- will wait safely in line until this transaction completes (COMMIT or ROLLBACK).
SELECT status 
FROM room_inventory 
WHERE room_id = 101 AND booking_date = '2026-08-15' 
FOR UPDATE;

-- Step 2: Safe, isolated conditional execution update
UPDATE room_inventory 
SET status = 'BOOKED', guest_id = 777
WHERE room_id = 101 AND booking_date = '2026-08-15' AND status = 'AVAILABLE';

COMMIT;
