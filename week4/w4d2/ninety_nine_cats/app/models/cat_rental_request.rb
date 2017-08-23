class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?(cat_id: cat_id)
      self.errors[:cat_id] << "is already booked"
    end
  end

  def approve!
    self.class.transaction  do
      self.update_attribute(:status, 'APRROVED')
      deny!
    end
  end

  def deny!
    overlapping_pending_requests.each do |request|
      request.update_attribute(:status, 'DENIED')
    end
  end

  def pending?
    status == "PENDING"
  end

  private

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def overlapping_requests
    self.class
        .where(cat_id: cat_id)
        .where.not('start_date > ? OR end_date < ?', end_date, start_date)
        .where.not(id: id)
  end

end
